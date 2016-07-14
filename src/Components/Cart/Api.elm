module Components.Cart.Api exposing (addItem, getCart, clearCart)

-- CORE MODULES

import Http
import Json.Decode exposing (..)
import Json.Encode as Encode

-- OUR MODULES

import Components.Cart.Types exposing (Cart, CartResponse, CartItem, Msg(..), ItemPayload)
import UtilsAndConstants.Api exposing (send, put, get)

-- API CALLS

getCart : Cmd Msg
getCart =
  get' "/cart"

clearCart : Cmd Msg
clearCart =
  get' "/cart/clear"

addItem : ItemPayload -> Cmd Msg
addItem item =
  put' "/cart/item" (buildCartItemPayload item)

-- HELPERS

get' : String -> Cmd Msg
get' url =
  get url mapToCart updateFail updateSuccess

put' : String -> Http.Body -> Cmd Msg
put' url payload =
  put url payload mapToCart updateFail updateSuccess

updateFail : Http.Error -> Msg
updateFail error =
  UpdateCartFail error

updateSuccess : CartResponse -> Msg
updateSuccess response =
  UpdateCartSuccess response

-- DECODERS

mapToCart : Decoder CartResponse
mapToCart =
    object4 CartResponse
      ("items" := list
        (object4 CartItem
          ("id" := int)
          ("name" := string)
          ("qty" := int)
          ("price" := int)
        )
      )
      ("subTotal" := float)
      ("tax" := float)
      ("total" := float)

-- PAYLOAD BUILDERS

buildCartItemPayload : ItemPayload -> Http.Body
buildCartItemPayload item =
  item
    |> encodeItemPayload
    |> Http.string

-- ENCODERS

encodeItemPayload : ItemPayload -> String
encodeItemPayload item =
    Encode.object
      [ ( "id", Encode.int item.id )
      , ( "qty", Encode.int item.qty )
      ]
    |> encode

encode : Encode.Value -> String
encode value =
  Encode.encode 0 value
