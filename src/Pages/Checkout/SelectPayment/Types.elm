module Pages.Checkout.SelectPayment.Types exposing (..)

-- OUR MODULES

import Components.NewCard.Types as NewCardTypes
import Components.SavedCard.Types as SavedCardTypes

-- TYPES

type Msg
  = NewCardMsg NewCardTypes.Msg
  | SavedCardMsg SavedCardTypes.Msg
  | UseAndSaveNewCard
  | SaveNewCard
  | UseNewCard
