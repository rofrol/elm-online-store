-- CORE MODULES

import Navigation

-- OUR MODULES

import App.Model exposing (init)
import App.Nav exposing (urlParser)
import App.Update exposing (update, urlUpdate)
import App.View exposing (view)
import App.Subscriptions exposing (subscriptions)

-- MAIN - Where is all begins

main : Program Never
main =
  Navigation.program urlParser
    { init = init
    , view = view
    , update = update
    , urlUpdate = urlUpdate
    , subscriptions = subscriptions
    }
