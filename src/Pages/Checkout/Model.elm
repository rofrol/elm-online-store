module Pages.Checkout.Model exposing (..)

-- OUR MODULES

import Components.Cart.Types exposing (Cart)
import Components.NewCard.Types exposing (NewCard)
import Components.SavedCard.Types exposing (SavedCard)

-- MODEL

type alias Model =
  { cart : Cart
  , newCard : NewCard
  , savedCard : SavedCard
  }
