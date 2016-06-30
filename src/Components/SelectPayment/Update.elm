module Components.SelectPayment.Update exposing (..)

-- OUR MODULES

import Components.SelectPayment.Types exposing (..)
import Components.SelectPayment.Model exposing (Model)
import Components.CreateCardForm.Update as CreateCardFormUpdate

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    CreateCardFormMsg msg ->
      let
        (model', cmds) =
          CreateCardFormUpdate.update msg model.newCard
      in
        { model | newCard = model' } ! []
