module Components.SelectPayment.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as App

-- OUR MODULES

import Components.SelectPayment.Model exposing (Model)
import Components.SelectPayment.Types exposing (Msg(..))
import Components.CreateCardForm.View as CreateCardFormView

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ div [ class "layout" ]
      [ div [ class "layout__item u-1/2" ]
        [ App.map CreateCardFormMsg (CreateCardFormView.view model.newCard)
        ]
      ]
    ]
