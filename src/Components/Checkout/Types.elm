module Components.Checkout.Types exposing (Msg(..))

-- OUR MODULES

import Components.SelectPayment.Types as SelectPaymentTypes

-- TYPES

type Msg
  = SelectPaymentMsg SelectPaymentTypes.Msg
