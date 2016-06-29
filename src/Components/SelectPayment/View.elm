module Components.SelectPayment.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)

-- OUR MODULES

import Components.CreateCardForm.View as CreateCardFormView

-- VIEW

view : Html a
view =
  div []
    [ div [ class "layout" ]
      [ div [ class "layout__item u-1/2" ]
        [ CreateCardFormView.view
        ]
      ]
    ]
