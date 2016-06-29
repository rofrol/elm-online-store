module Components.Counter.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing(..)

-- OUR MODULES

import Components.Counter.Types exposing (..)

-- VIEW

view : Model -> Maybe Int -> Maybe Int -> Html.Html Msg
-- Int ::: the bound value for counter
-- Msg ::: the Msg launched when clicking the '-' button
-- Msg ::: the Msg launched when clicking the '+' button

view model min max =
  let
    invisibleDecrementClass =
      case min of
        Just value ->
          if model == value then
            " u-invisible"
          else
            ""
        Nothing ->
          ""


    invisibleIncrementClass =
      case max of
        Just value ->
          if model == value then
            " u-invisible"
          else
            ""
        Nothing ->
          ""

    in
      div [ ]
        [ button [ class ("btn btn--small u-mr" ++ invisibleDecrementClass), onClick Decrement ] [ text "-" ]
        , span [] [ text (toString model) ]
        , button [ class ("btn btn--small u-ml" ++ invisibleIncrementClass), onClick Increment ] [ text "+" ]
        ]
