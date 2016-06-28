module Components.SelectPayment.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)

-- VIEW

view : Html a
view =
  div []
    [ div [ class "layout" ]
      [ div [ class "layout__item u-1/2" ]
        [ createCardForm ]
      ]
    ]

createCardForm : Html a
createCardForm =
  div []
    [ span [] [ text "New Card" ]
    , hr [ class "u-mb" ] []
    , input [ class "input u-1/1 u-mb-" ] []
    , input [ class "input u-1/1 u-mb-" ] []
    , input [ class "input u-1/1 u-mb-" ] []
    , input [ class "input u-1/1 u-mb-" ] []
    ]
