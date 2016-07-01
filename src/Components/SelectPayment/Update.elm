module Components.SelectPayment.Update exposing (..)

-- OUR MODULES

import Components.SelectPayment.Types exposing (..)
import Components.SelectPayment.Model exposing (Model)
import Components.NewCardForm.Update as NewCardFormUpdate

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NewCardFormMsg msg ->
      let
        (model', cmds) =
          NewCardFormUpdate.update msg model.newCard
      in
        { model | newCard = model' } ! []
