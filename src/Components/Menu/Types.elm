module Components.Menu.Types exposing (..)

-- CORE MODULES

import Http

-- TYPES

type Msg
  = IncrementItemQty Int
  | DecrementItemQty Int
  | UpdateItemQty Int Int
  | GetMenu
  | UpdateMenuSuccess MenuResponse
  | UpdateMenuFail Http.Error

type alias Menu =
  { items : List MenuItem
  , storeId : Int
  , isLoading : Bool
  , isLoaded : Bool
  , hasError : Bool
  }

type alias MenuItem =
  { id : Int
  , name : String
  , price : Int
  , qty : Int
  }

type alias MenuItemResponse =
  { id : Int
  , name : String
  , price : Int
  }

type alias MenuResponse =
  { items: List MenuItemResponse
  , storeId : Int
  }
