module Components.SavedCard.Api exposing (getSavedCard, saveCard)

-- CORE MODULES

import Http
import Json.Decode exposing (..)
import Json.Encode as Encode

-- OUR MODULES

import Components.SavedCard.Types exposing (..)
import Components.NewCard.Types exposing (NewCard)
import UtilsAndConstants.Api exposing (send, post, get)

-- HEADERS

headers : List ( String, String )
headers =
  [ ( "Content-Type", "application/json" )
  ]

-- API CALLS

getSavedCard : Cmd Msg
getSavedCard =
  get' "/card"

saveCard : NewCard -> Cmd Msg
saveCard card =
  post' "/card" (buildCardPayload card)

-- HELPERS

get' : String -> Cmd Msg
get' url =
  get url mapToSavedCard updateFail updateSuccess

post' : String -> Http.Body -> Cmd Msg
post' url payload =
  post url payload mapToSavedCard updateFail updateSuccess


updateFail : Http.Error -> Msg
updateFail error =
  UpdateSavedCardFail error

updateSuccess : SavedCardResponse -> Msg
updateSuccess response =
  UpdateSavedCardSuccess response

-- DECODERS

mapToSavedCard : Decoder SavedCardResponse
mapToSavedCard =
    object4 SavedCardResponse
      ("number" := string)
      ("name" := string)
      ("exp" := string)
      ("cvv" := string)

-- PAYLOAD BUILDERS

buildCardPayload : NewCard -> Http.Body
buildCardPayload card =
  card
    |> encodeCardPayload
    |> Http.string

-- ENCODERS

encodeCardPayload : NewCard -> String
encodeCardPayload card =
    Encode.object
      [ ( "number", Encode.string card.number )
      , ( "name", Encode.string card.name )
      , ( "exp", Encode.string card.exp )
      , ( "cvv", Encode.string card.cvv )
      ]
    |> encode

encode : Encode.Value -> String
encode value =
  Encode.encode 0 value
