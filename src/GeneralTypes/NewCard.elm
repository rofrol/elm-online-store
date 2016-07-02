module GeneralTypes.NewCard exposing (..)

type alias NewCard =
  { cardNumber : String
  , name : String
  , exp : String
  , cvv : String
  , hasError : Bool
  , errorMessages : List String
  }
