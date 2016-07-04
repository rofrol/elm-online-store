module App.Model exposing (init)

-- CORE MODULES

import Hop.Types exposing (Location)

-- OUR MODULES

import App.Types exposing (Route, Model, Msg)
import App.Update exposing (urlUpdate)
import Components.Menu.Types exposing (Menu)
import Components.Cart.Types exposing (Cart)
import Components.Card.Types exposing (NewCard, SavedCard)

-- INIT

init : (Route, Hop.Types.Location) -> ( Model, Cmd Msg )
init (route, location) =
  let
    model = initialModel (route, location)
  in
    urlUpdate (route, location) model

-- INITIAL MODEL

initialModel : (Route, Hop.Types.Location) -> Model
initialModel (route, location) =
    { title = "Elm Example"
    , menu = Menu [] 0 False False False
    , cart = Cart [] 0 0 0 False False False ""
    , newCard = NewCard "" "" "" "" False True False []
    , savedCard = SavedCard "" "" "" "" False False False False ""
    , location = location
    , route = route
    }
