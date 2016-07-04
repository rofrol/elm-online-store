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
import Components.LoadingSpinner.View as LoadingSpinnerView
import Components.CartSummary.View as CartSummaryView

-- VIEW

view : CheckoutSubRoute -> Model -> Html Msg
view route model =
  let
    subView =
      case route of
        SelectPayment ->
          App.map SelectPaymentMsg
            (SelectPaymentView.view { newCard = model.newCard, savedCard = model.savedCard})
        CheckoutSummary ->
          CheckoutSummaryView.view

    topView =
      if model.cart.isLoaded then
        div [ class "layout u-pb+" ]
          [ div [ class "layout__item u-3/5"]
            [ text "Ordering from: Elm Street"
            ]
          , div [ class "layout__item u-2/5"]
            [ CartSummaryView.view model.cart
            ]
          ]
      else text ""

  in
    div []
      [ LoadingSpinnerView.view model.cart.isLoading Nothing
      , topView
      , subView
      ]
