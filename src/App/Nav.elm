module App.Nav exposing (urlParser, routerConfig)

-- CORE MODULES

import Navigation
import Hop.Types exposing (Location, Config, PathMatcher)
import Hop.Matchers exposing (match1, nested1)
import Hop exposing (matchUrl)

-- OUR MODULES

import App.Types exposing (Model, Route(..), CheckoutSubRoute(..), Msg(..))

-- CONFIG

routerConfig : Config Route
routerConfig =
    { hash = True
    , basePath = ""
    , matchers = matchers
    , notFound = NotFoundRoute
    }

-- MATCHERS

matchers : List (PathMatcher Route)
matchers =
  [ match1 MainRoute ""
  , match1 AboutRoute "/about"
  , match1 MenuRoute "/menu"
  , nested1 CheckoutRoute "/checkout" checkoutMatchers
  ]

checkoutMatchers : List (PathMatcher CheckoutSubRoute)
checkoutMatchers =
  [ match1 SelectPayment "/select-payment"
  , match1 CheckoutSummary "/summary"
  ]


-- PARSER

urlParser : Navigation.Parser (Route, Location)
urlParser =
    Navigation.makeParser (.href >> matchUrl routerConfig)
