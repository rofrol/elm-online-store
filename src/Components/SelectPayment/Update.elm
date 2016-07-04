module Components.SelectPayment.Update exposing (..)

-- OUR MODULES

import Components.SelectPayment.Types exposing (..)
import Components.SelectPayment.Model exposing (Model)
import Components.Card.Update as CardUpdate

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NewCardFormMsg msg ->
      let
        (model', cmds) =
          CardUpdate.update msg (model.savedCard, model.newCard)
      in
        { model | newCard = snd model' } ! []
