module Components.Cart.Update exposing (..)

-- OUR MODULES

import Components.Cart.Types exposing (Cart, Msg(..))
import Components.Cart.Api exposing (getCart, clearCart, addItem)

-- UPDATE

update : Msg -> Cart -> (Cart, Cmd Msg)
update msg model =
  case msg of
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
      let
        { items, subTotal, tax, total } = response
      in
        { model |
          items = items,
          subTotal = subTotal,
          tax = tax,
          total = total,
          isLoading = False,
          isLoaded = True,
          hasError = False,
          errorMessage = ""
        }
        ! []

    UpdateCartFail error ->
      Cart [] 0 0 0 False False True (toString error)
      ! []

    SubmitCart ->
      model ! []

cartLoading : Cart
cartLoading =
  Cart [] 0 0 0 True False False ""
