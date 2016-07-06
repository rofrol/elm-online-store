module UtilsAndConstants.MakeUrl exposing (..)

-- OUR MODULES

import App.Config exposing (baseUrl)

-- UTILS

makeUrl : String -> String
makeUrl url =
  baseUrl ++ url
