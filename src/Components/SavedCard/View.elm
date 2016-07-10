module Components.SavedCard.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String

-- OUR MODULES

import Components.SavedCard.Types exposing (..)
import UtilsAndConstants.MakeUrl exposing (makeUrl)

-- VIEW

view : SavedCard -> Html Msg
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
          , a [ onClick UseSavedCard, class "btn", href (makeUrl "checkout/summary") ] [ text "Order Now" ]
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