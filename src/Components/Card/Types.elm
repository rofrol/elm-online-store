module Components.Card.Types exposing (..)

-- CORE MODULES

import Http

-- TYPES

type Msg
  = UpdateNewCardNumber String
  | UpdateNewCardName String
  | UpdateNewCardExpirationDate String
  | UpdateNewCardCVV String
  | MaybeSetErrorMessage FormError
  | MaybeClearErrorMessage FormError
  | UpdateNewCardHasError
  | SaveCard
  | GetSavedCard
  | UpdateSavedCardSuccess SavedCardResponse
  | UpdateSavedCardFail Http.Error

type alias SavedCard =
  { number : String
  , name : String
  , exp : String
  , cvv : String
  , isLoading : Bool
  , isLoaded : Bool
  , hasError : Bool
  , errorMessage : String
  }

type alias SavedCardResponse =
  { number : String
  , name : String
  , exp : String
  , cvv : String
  }

type alias NewCard =
  { number: String
  , name : String
  , exp : String
  , cvv : String
  , hasError : Bool
  , errorMessages : List String
  }

type FormError
  = CardNumberError
  | CardNameError
  | CardExpError
  | CardCVVError
