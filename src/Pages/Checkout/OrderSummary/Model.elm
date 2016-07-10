module Pages.Checkout.OrderSummary.Model exposing (..)

-- OUR MODULES

import Components.Cart.Types exposing (Cart)
import Components.SavedCard.Types exposing (SavedCard)
import Components.NewCard.Types exposing (NewCard)

-- MODEL

type alias Model =
  { cart : Cart
  , savedCard : SavedCard
  , newCard : NewCard
  }
