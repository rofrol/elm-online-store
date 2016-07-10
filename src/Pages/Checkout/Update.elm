module Pages.Checkout.Update exposing (..)

-- CORE MODULES


-- OUR MODULES

import Pages.Checkout.SelectPayment.Update as SelectPaymentUpdate
import Pages.Checkout.Types exposing (..)
import Pages.Checkout.Model exposing (Model)

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
