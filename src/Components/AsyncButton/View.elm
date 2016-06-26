module Components.AsyncButton.View exposing (..)

-- COURE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- OUR MODULES

import Components.LoadingSpinner.View as LoadingSpinner
import Components.LoadingSpinner.Types exposing (Type(..))

-- VIEW

view : Bool -> a -> String -> Html a
-- Bool ::: if True show spinner
-- a ::: the Msg to be launched when button is clicked
-- String ::: the text that displays in the button

view isLoading msg btnText =
  if isLoading then
    button [ class "btn btn--full", disabled True ] [ LoadingSpinner.view True (Just Btn) ]
  else
    button [ class "btn btn--full", onClick msg ] [ text btnText ]
