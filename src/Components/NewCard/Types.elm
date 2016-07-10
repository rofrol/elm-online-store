module Components.NewCard.Types exposing (..)

-- TYPES

type Msg
  = UpdateNewCardNumber String
  | UpdateNewCardName String
  | UpdateNewCardExpirationDate String
  | UpdateNewCardCVV String
  | MaybeSetErrorMessage FormError
  | MaybeClearErrorMessage FormError
  | UpdateNewCardHasError
  | UpdateNewCardShouldSave

type alias NewCard =
  { number: String
  , name : String
  , exp : String
  , cvv : String
  , shouldUse : Bool
  , hasError : Bool
  , shouldSave : Bool
  , errorMessages : List String
  }

type FormError
  = CardNumberError
  | CardNameError
  | CardExpError
  | CardCVVError
