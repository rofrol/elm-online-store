module Pages.Checkout.OrderSummary.Update exposing (update)

-- OUR MODULES

import Pages.Checkout.OrderSummary.Types exposing (Msg(..))
import Pages.Checkout.OrderSummary.Model exposing (Model)

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp ->
      model ! []
