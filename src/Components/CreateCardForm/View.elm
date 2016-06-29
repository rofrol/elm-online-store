module Components.CreateCardForm.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)

-- VIEW

view : Html a
view =
  div []
    [ div [] [ text "New Card" ]
    , hr [ class "u-mb" ] []
    , div [ class "form" ]
      [ div [ class "field-set" ]
        [ div [ class "field-set__labels" ]
          [ div [] [ text "Card Number" ]
          , div [] [ text "Name on Card" ]
          ]
        , div [ class "field-set__fields" ]
          [ input [] []
          , input [] []
          ]
        ]
      , div [ class "field-row" ]
        [ div [] [ text "Expiration Date" ]
        , input [] []
        , div [] [ text "CVV" ]
        , input [] []
        ]
      ]
    ]
