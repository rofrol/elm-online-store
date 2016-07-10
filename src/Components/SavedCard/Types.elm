module Components.SavedCard.Types exposing (..)

-- CORE MODULES

import Http

-- OUR MODULES

import Components.NewCard.Types exposing (NewCard)

-- TYPES

type Msg
  = SaveCard NewCard
  | GetSavedCard
  | UseSavedCard
  | UpdateSavedCardSuccess SavedCardResponse
  | UpdateSavedCardFail Http.Error

type alias SavedCard =
  { number : String
  , name : String
  , exp : String
  , cvv : String
  , shouldUse : Bool
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
