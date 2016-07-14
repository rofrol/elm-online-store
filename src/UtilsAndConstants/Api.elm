module UtilsAndConstants.Api exposing (..)

-- CORE MODULES

import Http exposing (defaultSettings, Request)
import Task
import Json.Decode exposing (Decoder)

-- OUR MODULES

import App.Config exposing (host, headers)

-- UTILS

get : String -> Decoder a -> (Http.Error -> b) -> (a -> b) -> Cmd b
get url mapper ifFail ifSuccess =
  Http.get mapper (host ++ url)
    |> Task.perform ifFail ifSuccess

put url payload mapper ifFail ifSuccess =
  payloadRequest putRequest url payload mapper ifFail ifSuccess

post url payload mapper ifFail ifSuccess =
  payloadRequest postRequest url payload mapper ifFail ifSuccess

-- HELPERS

payloadRequest requestType url payload mapper ifFail ifSuccess =
  let
    request = requestType url payload
  in
    send request mapper ifFail ifSuccess

send request responseMapper ifFail ifSuccess =
  Http.send defaultSettings request
    |> Http.fromJson responseMapper
    |> Task.perform ifFail ifSuccess

postRequest : String -> Http.Body -> Request
postRequest url payload =
  Request "POST" headers (host ++ url) payload

putRequest : String -> Http.Body -> Request
putRequest url payload =
  Request "PUT" headers (host ++ url) payload
