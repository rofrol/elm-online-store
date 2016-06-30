module App.Types exposing (Model, Route(..), Msg(..), CheckoutSubRoute(..))

-- CORE MODULES

import Hop.Types exposing (Location, Query)

-- OUR MODULES

import Components.Menu.Types exposing (Menu)
import Components.Cart.Types exposing (Cart)
import Components.Checkout.Types exposing (Msg)
import GeneralTypes.NewCard exposing (NewCard)

-- TYPES

type alias Model =
  { title : String
  , menu : Menu
  , cart : Cart
  , newCard : NewCard
  , location : Location
  , route : Route
  }

type Route
    = AboutRoute
    | MainRoute
    | MenuRoute
    | CheckoutRoute CheckoutSubRoute
    | NotFoundRoute

type CheckoutSubRoute
  = SelectPayment
  | CheckoutSummary

type Msg
  = NoOp
  | ToggleDebugger
  | NavigateTo String
  | SetQuery Query
  | MenuMsg Components.Menu.Types.Msg
  | CheckoutMsg Components.Checkout.Types.Msg
