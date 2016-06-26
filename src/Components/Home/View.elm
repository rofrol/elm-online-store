module Components.Home.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- OUR MODULES

import App.Types exposing (Msg(..))

-- VIEW

view : Html Msg
view =
  div [ class "layout layout--center" ]
    [ button [ class "btn", onClick (NavigateTo "menu") ] [ text "Begin Order"]
    ]
