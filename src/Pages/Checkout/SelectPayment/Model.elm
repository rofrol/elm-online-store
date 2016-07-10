module Pages.Checkout.SelectPayment.Model exposing (Model)

-- OUR MODULES

import Components.NewCard.Types exposing (NewCard)
import Components.SavedCard.Types exposing (SavedCard)

-- TYPES

type alias Model =
  { savedCard : SavedCard
  , newCard : NewCard
  }
