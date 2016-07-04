module Components.Checkout.Model exposing (..)

-- OUR MODULES

import Components.Cart.Types exposing (Cart)
import Components.Card.Types exposing (NewCard, SavedCard)

-- MODEL

type alias Model =
  { cart : Cart
  , newCard : NewCard
  , savedCard : SavedCard
  }
