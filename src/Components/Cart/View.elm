module Components.Cart.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- OUR MODULES

import Components.Cart.Types exposing (Cart, Msg(..))
import Components.LoadingSpinner.View as LoadingSpinner

-- VIEW

view : Cart -> Html Msg
view cart =
  let
    cartBody =
      if cart.isLoaded then
        div []
          [ div [ class "spread u-pb" ]
            [ span [ class "spread_l" ]
              [ text "Total:" ]
            , span [ class "spread_r" ]
              [ text ("$" ++ (toString cart.total)) ]
            ]
          , div [ class "layout" ] (List.map cartItemView cart.items)
          ]
      else
        text ""

    cartItemView item =
      div [ class "layout__item" ]
        [ div [ class "spread u-pb" ]
          [ span [class "spread__l"] [ text ((toString item.qty) ++ " " ++ item.name) ]
          , span [class "spread__r"] [ text ("$" ++ (toString (item.price * item.qty))) ]
          ]
        ]

    clearCartButton =
      if (List.length cart.items) > 0 then
        div []
          [ button [ class "btn btn--full btn--negative u-mb-", onClick ClearCart ] [ text "Clear Cart" ]
          , a [ href "/#/checkout/select-payment", class "btn btn--full" ] [ text "checkout" ]
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
