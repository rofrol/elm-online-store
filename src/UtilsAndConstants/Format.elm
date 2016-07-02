module UtilsAndConstants.Format exposing (..)

-- CORE MODULES

import Char exposing (isDigit)
import String exposing (length, slice, concat)

-- FORMATTERS

formatCardNumber : a -> String
formatCardNumber num =
    num
    |> toString
    |> String.filter isDigit
    |> injectCharacter 4 "-"

formatCardExpiration : a -> String
formatCardExpiration num =
    num
    |> toString
    |> String.filter isDigit
    |> injectCharacter 2 "/"

formatCVV : a -> String
formatCVV num =
  num
  |> toString
  |> String.filter isDigit

-- HELPERS

injectCharacter : Int -> String -> String -> String
injectCharacter sliceIndex character targetString =
-- Add character after every (sliceIndex) characters to targetString
  let
    format sliceIndex' character' accumulator targetString' =
      if length targetString' > sliceIndex' then
        let
          first = slice 0 sliceIndex' targetString'
          rest = slice sliceIndex' (length targetString') targetString'
        in
          format sliceIndex' character' (concat [accumulator, first, character']) rest
      else
        concat [accumulator, targetString']
  in
    format sliceIndex character "" targetString
