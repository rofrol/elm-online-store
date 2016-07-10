module Pages.Checkout.Types exposing (Msg(..))

-- OUR MODULES

import Pages.Checkout.SelectPayment.Types as SelectPaymentTypes

-- TYPES

type Msg
  = SelectPaymentMsg SelectPaymentTypes.Msg
