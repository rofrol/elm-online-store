module Components.CreateCardForm.Update exposing (update)

-- OUR MODULES

import Components.CreateCardForm.Types exposing (..)
import GeneralTypes.NewCard exposing (NewCard)
import Utils.Format exposing (formatCardNumber, formatCardExpiration, formatCVV)

-- UPDATE

update : Msg -> NewCard -> (NewCard, Cmd Msg)
update msg model =
  case msg of
    Submit ->
      model ! []

    CardNumber newNum ->
      { model | cardNumber = formatCardNumber newNum}
      ! []

    Name newName ->
      { model | name = newName }
      ! []

    ExpirationDate newExp ->
      { model | exp = formatCardExpiration newExp }
      ! []

    CVV newCVV ->
      { model | cvv = formatCVV newCVV }
      ! []
