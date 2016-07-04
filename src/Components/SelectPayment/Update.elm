module Components.SelectPayment.Update exposing (..)

-- OUR MODULES

import Components.SelectPayment.Types exposing (..)
import Components.SelectPayment.Model exposing (Model)
import Components.Card.Update as CardUpdate
import Components.Card.Types as CardTypes
import Update.Extra exposing (andThen)

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    CardMsg msg ->
      let
        (model', cmds) =
          CardUpdate.update msg (model.savedCard, model.newCard)
      in
        Model (fst model') (snd model') ! []

    UseAndSaveNewCard ->
      let
        saveCard (model', cmd') =
          andThen update SaveNewCard ( model', cmd' )
        useNewCard (model', cmd') =
          andThen update UseNewCard ( model', cmd' )
      in
        model ! []
          |> saveCard
          |> useNewCard

    SaveNewCard ->
      if model.newCard.shouldSave then
        let
          (model', cmds) =
            CardUpdate.update CardTypes.SaveCard (model.savedCard, model.newCard)
        in
          { model | newCard = snd model' } ! [ Cmd.map CardMsg cmds ]
      else
        model ! []

    UseNewCard ->
      let
        updateNewCard card =
          { card | shouldUse = True }
        updateSavedCard card =
          { card | shouldUse = False }
      in
        { model
          | newCard = updateNewCard model.newCard
          , savedCard = updateSavedCard model.savedCard
        } ! []
