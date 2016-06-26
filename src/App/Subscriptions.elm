module App.Subscriptions exposing (subscriptions)

-- OUR MODULES

import App.Types exposing (Model, Msg(..))

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
