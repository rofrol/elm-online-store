module Components.Home.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)

-- OUR MODULES

import App.Types exposing (Msg(..))

-- VIEW

view : Html Msg
view =
  div [ class "u-txt-c" ]
    [ a [ href "/#/menu", class "btn" ] [ text "Begin Order" ]
    ]
