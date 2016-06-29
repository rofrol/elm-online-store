module Components.Menu.Model exposing (..)

-- OUR MODULES

import Components.Menu.Types exposing (Menu)
import Components.Cart.Types exposing (Cart)

-- Model

type alias Model =
  { menu : Menu
  , cart : Cart
  }
