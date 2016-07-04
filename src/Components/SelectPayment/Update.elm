module Components.SelectPayment.Update exposing (..)

-- OUR MODULES

import Components.SelectPayment.Types exposing (..)
import Components.SelectPayment.Model exposing (Model)
import Components.Card.Update as CardUpdate
import Components.Card.Types as CardTypes

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    CardMsg msg ->
      let
        (model', cmds) =
          CardUpdate.update msg (model.savedCard, model.newCard)
      in
        Model (Debug.log "test2" (fst model')) (snd model') ! []

    CheckoutAndSave ->
      let
        (model', cmds) =
          CardUpdate.update CardTypes.SaveCard (model.savedCard, model.newCard)
      in
        { model | newCard = snd model' } ! [ Cmd.map CardMsg cmds ]
