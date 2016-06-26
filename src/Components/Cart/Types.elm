module Components.Cart.Types exposing (..)

-- CORE MODUELS

import Http exposing (..)

-- TYPES

type Msg
  = AddItemToCart ItemPayload
  | UpdateCartFail Http.Error
  | UpdateCartSuccess CartResponse
  | ClearCart
  | GetCart
  | SubmitCart

type alias Cart =
  { items : List CartItem
  , total : Int
  , isLoading : Bool
  , isLoaded : Bool
  , hasError : Bool
  }

type alias CartItem =
  { id : Int
  , name : String
  , qty : Int
  , price : Int
  }

type alias CartResponse =
  { items: List CartItem
  , total : Int
  }

type alias ItemPayload =
  { id : Int
  , qty : Int
  }
