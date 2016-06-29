module Components.Menu.Types exposing (..)

-- CORE MODULES

import Http

-- OUR MODULES

import Components.Counter.Types as Counter
import Components.Cart.Types as CartTypes

-- TYPES

type Msg
  = UpdateItemQty Int Counter.Msg
  | GetMenu
  | UpdateMenuSuccess MenuResponse
  | UpdateMenuFail Http.Error
  | CartMsg CartTypes.Msg

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
