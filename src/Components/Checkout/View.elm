module Components.Checkout.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)

-- OUR MODULES

import App.Types exposing (CheckoutSubRoute(..))
import Components.Cart.Types exposing (Cart)
import Components.Checkout.Types exposing (Msg)
import Components.SelectPayment.View as SelectPaymentView
import Components.CheckoutSummary.View as CheckoutSummaryView

-- VIEW

view : CheckoutSubRoute -> Cart -> Html Msg
view route cart =
  let
    subView =
      case route of
        SelectPayment ->
          SelectPaymentView.view
        CheckoutSummary ->
          CheckoutSummaryView.view
  in
    div []
      [ div [ class "layout u-pb" ]
        [ div [ class "layout__item u-1/2"]
          [ text "Ordering from: "
          ]
        , div [ class "layout__item u-1/2"]
          [ div [ class "spread" ]
            [ span [ class "spread__l" ] [ text "Total: " ]
            , span [ class "spread__r" ] [ text ("$" ++ (toString cart.total)) ]
            ]
          ]
        ]
      , subView
      ]
