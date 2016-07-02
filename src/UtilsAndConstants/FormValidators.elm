module UtilsAndConstants.FormValidators exposing (..)

-- CORE MODULES

import String exposing (..)

-- VALIDATORS

validateCardNumber : String -> Bool
validateCardNumber cardNumber =
  String.length cardNumber == 19

validateName : String -> Bool
validateName name =
  String.length name > 0

validateCardExp : String -> Bool
validateCardExp exp =
  String.length exp == 5

validateCardCVV : String -> Bool
validateCardCVV cvv =
  String.length cvv > 2
