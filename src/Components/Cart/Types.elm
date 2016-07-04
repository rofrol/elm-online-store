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
  , subTotal : Float
  , tax : Float
  , total : Float
  , isLoading : Bool
  , isLoaded : Bool
  , hasError : Bool
  , errorMessage : String
  }

type alias CartItem =
  { id : Int
  , name : String
  , qty : Int
  , price : Int
  }

type alias CartResponse =
  { items : List CartItem
  , subTotal : Float
  , tax : Float
  , total : Float
  }

type alias ItemPayload =
  { id : Int
  , qty : Int
  }
