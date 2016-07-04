module Components.Card.SavedCardView exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)

-- VIEW

view : Html a
view =
  div []
    [ h4 [ class "u-m0" ] [ text "Saved Card" ]
    , hr [ class "u-mb" ] []
    , div [ class "spread" ]
      [ div [] [ text "Card ending in 2456" ]
      , button [ class "btn" ] [ text "Order Now" ]
      ]
    ]
