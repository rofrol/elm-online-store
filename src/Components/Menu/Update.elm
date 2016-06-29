module Components.Menu.Update exposing (..)

-- OUR MODULES

import Components.Menu.Model exposing (Model)
import Components.Menu.Types exposing (Menu, MenuItem, MenuItemResponse, Msg(..))
import Components.Menu.Api exposing (getMenu)
import Components.Cart.Update as Cart
import Components.Counter.Update as Counter

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    UpdateItemQty id msg ->
      let
        updateItem item =
          if item.id == id then
            { item | qty = Counter.update msg item.qty }
          else
            item

        updateMenu menu =
          { menu | items = List.map updateItem model.menu.items }
      in
        { model | menu = updateMenu model.menu }
        ! []

    GetMenu ->
      { model | menu = Menu [] 0 True False False }
      ! [ getMenu ]

    UpdateMenuSuccess response ->
      { model | menu =
        Menu
          (List.map mapMenuItem response.items)
          response.storeId
          False
          True
          False
      }
      ! []

    UpdateMenuFail error ->
      { model | menu = (Menu [] 0 False False True) }
      ! []

    CartMsg msg ->
      let
        result =
          Cart.update msg model.cart

        newCart = fst result

        cartCmds = snd result
      in
        { model | cart = newCart }
        ! [Cmd.map CartMsg cartCmds]


mapMenuItem : MenuItemResponse -> MenuItem
mapMenuItem response =
  MenuItem
    response.id
    response.name
    response.price
    1
