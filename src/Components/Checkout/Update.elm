module Components.Checkout.Update exposing (..)

-- CORE MODULES


-- OUR MODULES

import Components.SelectPayment.Update as SelectPaymentUpdate
import Components.Checkout.Types exposing (..)
import Components.Checkout.Model exposing (Model)

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    SelectPaymentMsg msg ->
      let
        (model', cmds) =
          SelectPaymentUpdate.update msg { newCard = model.newCard, savedCard = model.savedCard }
      in
        { model | newCard = model'.newCard, savedCard = model'.savedCard }
        ! [ Cmd.map SelectPaymentMsg cmds ]
