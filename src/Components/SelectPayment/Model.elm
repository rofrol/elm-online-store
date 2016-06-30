module Components.SelectPayment.Model exposing (Model)

-- OUR MODULES

import GeneralTypes.NewCard exposing (NewCard)

-- TYPES

type alias Model =
  { newCard : NewCard
  }
