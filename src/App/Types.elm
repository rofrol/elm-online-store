module App.Types exposing (Model, Route(..), Msg(..), CheckoutSubRoute(..))

-- CORE MODULES

import Hop.Types exposing (Location, Query)

-- OUR MODULES

import Components.Menu.Types as MenuTypes exposing (Menu)
import Components.Cart.Types as CartTypes exposing (Cart)
import Pages.Checkout.Types exposing (Msg)
import Pages.Menu.Types as PageMenuTypes
import Components.NewCard.Types exposing (NewCard)
import Components.SavedCard.Types as SavedCardTypes exposing (SavedCard)

-- TYPES

type alias Model =
  { title : String
  , menu : Menu
  , cart : Cart
  , newCard : NewCard
  , savedCard : SavedCard
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
  | PageMenuMsg PageMenuTypes.Msg
  | PageCheckoutMsg Pages.Checkout.Types.Msg
  | CartMsg CartTypes.Msg
  | SavedCardMsg SavedCardTypes.Msg
