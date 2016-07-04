module Components.Card.SavedCardView exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import String

-- OUR MODULES

import Components.Card.Types exposing (SavedCard)

-- VIEW

view : SavedCard -> Html a
view savedCard =
  let
    last4 =
      String.right 4 savedCard.number

    savedCardView =
      if String.isEmpty savedCard.number then
        text ""
      else
        div [ class "spread" ]
          [ div [] [ text ("Card ending in " ++ last4) ]
          , button [ class "btn" ] [ text "Order Now" ]
          ]

    noSavedCards =
      if String.isEmpty savedCard.number then
        div [] [ text "You have no saved cards" ]
      else
        text ""
  in
    div []
      [ savedCardView
      , noSavedCards
      ]
