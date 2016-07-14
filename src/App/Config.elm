module App.Config exposing (..)

host : String
host = "http://localhost:8000"
-- host = "http://zachwilliamson.me:8000"

baseUrl : String
baseUrl = "/#/"
-- baseUrl = "/apps/elm-online-store-example/#/"

headers : List ( String, String )
headers =
  [ ( "Content-Type", "application/json" )
  ]
