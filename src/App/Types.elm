module App.Types exposing (Model, Route(..), Msg(..), CheckoutSubRoute(..))

-- CORE MODULES

import Hop.Types exposing (Location, Query)

-- OUR MODULES

import Components.Menu.Types as MenuTypes
import Components.Cart.Types as CartTypes
import Components.Checkout.Types exposing (Msg)
import Components.Card.Types as CardTypes

-- TYPES

type alias Model =
  { title : String
  , menu : MenuTypes.Menu
  , cart : CartTypes.Cart
  , newCard : CardTypes.NewCard
  , savedCard : CardTypes.SavedCard
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
  | MenuMsg MenuTypes.Msg
  | CheckoutMsg Components.Checkout.Types.Msg
  | CartMsg CartTypes.Msg
  | CardMsg CardTypes.Msg
