module Components.Checkout.Model exposing (..)

-- OUR MODULES

import Components.Cart.Types exposing (Cart)
import GeneralTypes.NewCard exposing (NewCard)

-- MODEL

type alias Model =
  { cart : Cart
  , newCard : NewCard
  }
