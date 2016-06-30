module Components.Checkout.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as App

-- OUR MODULES

import Components.Checkout.Model exposing (Model)
import Components.Checkout.Types exposing (..)
import App.Types exposing (CheckoutSubRoute(..))
import Components.Checkout.Types exposing (Msg)
import Components.SelectPayment.View as SelectPaymentView
import Components.CheckoutSummary.View as CheckoutSummaryView

-- VIEW

view : CheckoutSubRoute -> Model -> Html Msg
view route model =
  let
    subView =
      case route of
        SelectPayment ->
          App.map SelectPaymentMsg (SelectPaymentView.view { newCard = model.newCard })
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
            , span [ class "spread__r" ] [ text ("$" ++ (toString model.cart.total)) ]
            ]
          ]
        ]
      , subView
      ]
