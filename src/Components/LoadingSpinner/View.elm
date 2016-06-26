module Components.LoadingSpinner.View exposing (view)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)

-- OUR MODULES

import Components.LoadingSpinner.Types exposing (..)

-- VIEW

view : Bool -> Maybe Type -> Html a
-- Bool ::: if True shows spinner
-- Maybe Type ::: affects the style of the spinner

view isLoading type' =
  let
    loaderType =
      case type' of
        Just Btn ->
          div [ class "loader--button" ] []

        Nothing ->
          div [ class "loader" ] []
  in
    if isLoading then
      loaderType
    else
      text ""
