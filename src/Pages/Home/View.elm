module Pages.Home.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)

-- OUR MODULES

import App.Types exposing (Msg(..))
import UtilsAndConstants.MakeUrl exposing (makeUrl)

-- VIEW

view : Html Msg
view =
  div [ class "u-txt-c" ]
    [ a [ href (makeUrl "menu"), class "btn" ] [ text "Begin Order" ]
    ]
