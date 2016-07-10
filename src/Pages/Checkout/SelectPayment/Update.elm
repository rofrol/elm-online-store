module Pages.Checkout.SelectPayment.Update exposing (..)

-- OUR MODULES

import Pages.Checkout.SelectPayment.Types exposing (..)
import Pages.Checkout.SelectPayment.Model exposing (Model)
import Components.SavedCard.Update as SavedCardUpdate
import Components.SavedCard.Types as SavedCardTypes
import Components.NewCard.Update as NewCardUpdate
import Components.NewCard.Types as NewCardTypes
import Update.Extra exposing (andThen)

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NewCardMsg msg ->
      let (model', cmds) =
        NewCardUpdate.update msg model.newCard
      in
        { model | newCard = model' } ! [ Cmd.map NewCardMsg cmds ]

    SavedCardMsg msg ->
      let (model', cmds) =
        SavedCardUpdate.update msg model.savedCard
      in
        { model | savedCard = model' } ! [ Cmd.map SavedCardMsg cmds ]

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
        let (model', cmds) =
            SavedCardUpdate.update (SavedCardTypes.SaveCard model.newCard) model.savedCard
        in
          { model | savedCard = model' } ! [ Cmd.map SavedCardMsg cmds ]
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
