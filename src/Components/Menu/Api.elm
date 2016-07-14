module Components.Menu.Api exposing (getMenu)

-- CORE MODULES

import Http
import Json.Decode exposing (..)

-- OUR MODULES

import Components.Menu.Types exposing (Msg(..), MenuResponse, MenuItemResponse)
import UtilsAndConstants.Api exposing (get)

-- API CALLS

getMenu : Cmd Msg
getMenu =
  get "/menu" mapToMenu updateFail updateSuccess

-- HELPERS

updateFail : Http.Error -> Msg
updateFail error =
  UpdateMenuFail error

updateSuccess : MenuResponse -> Msg
updateSuccess response =
  UpdateMenuSuccess response

-- DECODERS

mapToMenu: Decoder MenuResponse
mapToMenu =
    object2 MenuResponse
      ("items" := list
        (object3 MenuItemResponse
          ("id" := int)
          ("name" := string)
          ("price" := int)
        )
      )
      ("storeId" := int)
