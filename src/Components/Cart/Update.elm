module Components.Cart.Update exposing (..)

-- OUR MODULES

import Components.Cart.Types exposing (Cart, Msg(..))
import Components.Cart.Api exposing (getCart, clearCart, addItem)

-- UPDATE

update : Msg -> Cart -> (Cart, Cmd Msg)
update msg model =
  case (Debug.log "Cart.Update" msg) of
    GetCart ->
      cartLoading
      ! [ getCart ]

    ClearCart ->
      cartLoading
      ! [ clearCart ]

    AddItemToCart item ->
      cartLoading
      ! [ (addItem item) ]

    UpdateCartSuccess response ->
      Cart response.items response.total False True False
      ! []

    UpdateCartFail error ->
      Cart [] 0 False False True
      ! []

    SubmitCart ->
      model ! []

cartLoading : Cart
cartLoading =
  Cart [] 0 True False False
