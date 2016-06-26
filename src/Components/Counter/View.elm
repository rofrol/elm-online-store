module Components.Counter.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing(..)

-- OUR MODULES

import Components.Counter.Types exposing (..)

-- VIEW

view : Model -> Html.Html Msg
-- Int ::: the bound value for counter
-- Msg ::: the Msg launched when clicking the '-' button
-- Msg ::: the Msg launched when clicking the '+' button

view model =
    div [ ]
      [ button [ class "btn btn--small u-mr", onClick Decrement ] [ text "-" ]
      , span [] [ text (toString model) ]
      , button [ class "btn btn--small u-ml", onClick Increment ] [ text "+" ]
      ]
