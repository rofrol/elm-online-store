module Components.CartSummary.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)

-- OUR MODULES

import Components.Cart.Types exposing (Cart)

-- VIEW

view : Cart -> Html a
view cart =
  div []
    [ div [ class "spread" ]
      [ span [ class "spread__l" ] [ text "SubTotal: " ]
      , span [ class "spread__r" ] [ text ("$" ++ (toString cart.subTotal)) ]
      ]
    , div [ class "spread" ]
      [ span [ class "spread__l" ] [ text "Tax: " ]
      , span [ class "spread__r" ] [ text ("$" ++ (toString cart.tax)) ]
      ]
    , div [ class "spread" ]
      [ span [ class "spread__l" ] [ text "Total: " ]
      , span [ class "spread__r" ] [ text ("$" ++ (toString cart.total)) ]
      ]
    ]
