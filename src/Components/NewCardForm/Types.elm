module Components.NewCardForm.Types exposing (..)

type Msg
  = UpdateCardNumber String
  | UpdateName String
  | UpdateExpirationDate String
  | UpdateCVV String
  | MaybeSetErrorMessage FormError
  | MaybeClearErrorMessage FormError
  | UpdateHasError

type FormError
  = CardNumberError
  | CardNameError
  | CardExpError
  | CardCVVError
