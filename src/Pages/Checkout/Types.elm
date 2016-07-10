module Pages.Checkout.Types exposing (Msg(..))

-- OUR MODULES

import Pages.Checkout.SelectPayment.Types as SelectPaymentTypes
import Pages.Checkout.OrderSummary.Types as OrderSummaryTypes

-- TYPES

type Msg
  = SelectPaymentMsg SelectPaymentTypes.Msg
  | OrderSummaryMsg OrderSummaryTypes.Msg
