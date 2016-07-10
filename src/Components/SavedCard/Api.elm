module Components.SavedCard.Api exposing (getSavedCard, saveCard)

-- CORE MODULES

import Http exposing (defaultSettings, Request)
import Task
import Json.Decode exposing (..)
import Json.Encode as Encode

-- OUR MODULES

import App.Config exposing (host)
import Components.SavedCard.Types exposing (..)
import Components.NewCard.Types exposing (NewCard)

-- HEADERS

headers : List ( String, String )
headers =
  [ ( "Content-Type", "application/json" )
  ]

-- API CALLS

getSavedCard : Cmd Msg
getSavedCard =
  Http.get mapToSavedCard (host ++ "/card")
    |> Task.perform updateFail updateSuccess

saveCard : NewCard -> Cmd Msg
saveCard card =
  let
    payload =
      buildCardPayload card
    request =
      Request "POST" headers (host ++ "/card") payload
  in
    send request

-- HELPERS

send : Request -> Cmd Msg
send request =
  Http.send defaultSettings request
    |> Http.fromJson mapToSavedCard
    |> Task.perform updateFail updateSuccess

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
