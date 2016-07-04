module Components.SelectPayment.Types exposing (..)

-- OUR MODULES

import Components.Card.Types as CardTypes

-- TYPES

type Msg
  = CardMsg CardTypes.Msg
  | UseAndSaveNewCard
  | SaveNewCard
  | UseNewCard
