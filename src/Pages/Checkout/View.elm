module Pages.Checkout.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as App

-- OUR MODULES

import Pages.Checkout.Model exposing (Model)
import Pages.Checkout.Types exposing (..)
import App.Types exposing (CheckoutSubRoute(..))
import Pages.Checkout.SelectPayment.View as SelectPaymentView
import Pages.Checkout.OrderSummary.View as OrderSummaryView
import Components.LoadingSpinner.View as LoadingSpinnerView
import Components.Cart.SummaryView as CartSummaryView

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
          OrderSummaryView.view

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
