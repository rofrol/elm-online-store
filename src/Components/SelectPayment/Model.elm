module Components.SelectPayment.Model exposing (Model)

-- OUR MODULES

import Components.Card.Types exposing (NewCard, SavedCard)

-- TYPES

type alias Model =
  { savedCard : SavedCard
  , newCard : NewCard
  }
