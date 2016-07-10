module Components.Menu.Update exposing (..)

-- OUR MODULES

import Components.Menu.Types exposing (Menu, MenuItem, MenuItemResponse, Msg(..))
import Components.Menu.Api exposing (getMenu)
import Components.Counter.Update as Counter

-- UPDATE

update : Msg -> Menu -> (Menu, Cmd Msg)
update msg menu =
  case msg of
    UpdateItemQty id msg ->
      let
        updateItem item =
          if item.id == id then
            { item | qty = Counter.update msg item.qty }
          else
            item
      in
        { menu | items = List.map updateItem menu.items }
        ! []

    GetMenu ->
      (Menu [] 0 True False False)
      ! [ getMenu ]

    UpdateMenuSuccess response ->
      (Menu
        (List.map mapMenuItem response.items)
        response.storeId
        False
        True
        False
      )
      ! []

    UpdateMenuFail error ->
      (Menu [] 0 False False True)
      ! []

mapMenuItem : MenuItemResponse -> MenuItem
mapMenuItem response =
  MenuItem
    response.id
    response.name
    response.price
    1
