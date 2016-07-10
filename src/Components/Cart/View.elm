module Components.Cart.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- OUR MODULES

import Components.Cart.Types exposing (Cart, Msg(..))
import Components.LoadingSpinner.View as LoadingSpinner
import Components.Cart.SummaryView as CartSummaryView
import Components.Cart.ItemsView as CartItemsView
import UtilsAndConstants.MakeUrl exposing (makeUrl)

-- VIEW

view : Cart -> Html Msg
view cart =
  let
    cartBody =
      if cart.isLoaded then
        div []
          [ CartSummaryView.view cart
          , CartItemsView.view cart
          ]
      else if (List.length cart.items) == 0 && not cart.isLoading then
        text "Your cart is empty"
      else
        text ""

    clearCartButton =
      if (List.length cart.items) > 0 then
        div []
          [ button [ class "btn btn--full btn--negative u-mb-", onClick ClearCart ] [ text "Clear Cart" ]
          , a [ href (makeUrl "checkout/select-payment"), class "btn btn--full" ] [ text "checkout" ]
          ]
      else
        text ""
  in
    div []
      [ h1 [] [ text "Cart" ]
      , cartBody
      , clearCartButton
      , LoadingSpinner.view cart.isLoading Nothing
      ]
