module App.Types exposing (Model, Route(..), Msg(..))

-- CORE MODULES

import Hop.Types exposing (Location, Query)

-- OUR MODULES

import Components.Menu.Types exposing (Menu, Msg)

-- TYPES

type alias Model =
  { title : String
  , menu : Menu
  , location : Location
  , route : Route
  }

type Route
    = AboutRoute
    | MainRoute
    | MenuRoute
    | NotFoundRoute

type Msg
  = NoOp
  | NavigateTo String
  | SetQuery Query
  | MenuMsg Components.Menu.Types.Msg
