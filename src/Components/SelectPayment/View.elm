module Components.SelectPayment.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as App

-- OUR MODULES

import Components.SelectPayment.Model exposing (Model)
import Components.SelectPayment.Types exposing (Msg(..))
import Components.NewCardForm.View as NewCardFormView

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ div [ class "layout layout--huge" ]
      [ div [ class "layout__item u-1/2" ]
        [ App.map NewCardFormMsg (NewCardFormView.view model.newCard)
        , div [ class "spread u-mt" ]
          [ label [ class "label" ]
            [ span [ class "u-pr-" ] [ text "Save Card" ]
            , input [ type' "checkbox", value "text" ] []
            ]
          , button [ class "btn" ] [ text "Order Now" ]
          ]
        ]
      , div [ class "layout__item u-1/2" ]
        [ div [] [ text "Saved Card" ]
        , hr [ class "u-mb" ] []
        , div [ class "spread" ]
          [ div [] [ text "Card ending in 2456" ]
          , button [ class "btn" ] [ text "Order Now" ]
          ]
        ]
      ]
    ]
