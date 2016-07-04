module Components.Cart.Api exposing (addItem, getCart, clearCart)

-- CORE MODULES

import Http exposing (defaultSettings, Request)
import Task
import Json.Decode exposing (..)
import Json.Encode as Encode

-- OUR MODULES

import Components.Cart.Types exposing (Cart, CartResponse, CartItem, Msg(..), ItemPayload)
import App.Config exposing (host)

-- HEADERS

headers : List ( String, String )
headers =
  [ ( "Content-Type", "application/json" )
  ]

-- API CALLS

getCart : Cmd Msg
getCart =
  Http.get mapToCart (host ++ "/cart")
    |> Task.perform updateFail updateSuccess

clearCart : Cmd Msg
clearCart =
  Http.get mapToCart (host ++ "/cart/clear")
    |> Task.perform updateFail updateSuccess

addItem : ItemPayload -> Cmd Msg
addItem item =
  let
    payload =
      buildCartItemPayload item
    request =
      Request "PUT" headers (host ++ "/cart/item") payload
  in
    send request

-- HELPERS

send : Request -> Cmd Msg
send request =
  Http.send defaultSettings request
    |> Http.fromJson mapToCart
    |> Task.perform updateFail updateSuccess

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
