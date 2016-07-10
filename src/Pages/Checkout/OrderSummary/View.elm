module Pages.Checkout.OrderSummary.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import String

-- OUR MODULES

import Pages.Checkout.OrderSummary.Model exposing (Model)
import Pages.Checkout.OrderSummary.Types exposing (Msg(..))
import Components.Cart.ItemsView as ItemsView

-- VIEW

view : Model -> Html Msg
view model =
  let
    (cardName, cardLastFour) =
      if model.savedCard.shouldUse then
        (model.savedCard.name, (String.right 4 model.savedCard.number))
      else
        (model.newCard.name, (String.right 4 model.newCard.number))
  in
    div []
      [ div [ class "layout layout--huge" ]
        [ div [ class "layout__item u-1/2" ]
          [ div [ class "u-3/4" ]
            [ h4 [] [ text "Payment Summary" ]
            , div [ class "u-pb-" ] [ text cardName ]
            , div [ class "u-pb-" ] [ text ("Card ending in " ++ cardLastFour) ]
            , div [ class "u-txt-c" ]
              [ a [ class "btn u-mt-" ] [ text "Order Now" ]
              ]
            ]
          ]
        , div [ class "layout__item u-1/2" ]
          [ h4 [] [ text "Cart Summary" ]
          , ItemsView.view model.cart
          ]
        ]
      ]
