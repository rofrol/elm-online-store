module Components.CreateCardForm.Types exposing (..)

type Msg
  = Submit
  | CardNumber String
  | Name String
  | ExpirationDate String
  | CVV String
