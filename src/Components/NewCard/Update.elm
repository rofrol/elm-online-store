module Components.NewCard.Update exposing (update)

-- CORE MODULES

import Update.Extra exposing (andThen)

-- OUR MODULES

import Components.NewCard.Types exposing (..)
import UtilsAndConstants.Format exposing (formatCardNumber, formatCardExpiration, formatCVV)
import UtilsAndConstants.FormValidators exposing (validateCardNumber, validateName, validateCardExp, validateCardCVV)
import UtilsAndConstants.Errors exposing (cardNumberErrorMsg, nameErrorMsg, cardExpErrorMsg, cardCVVErrorMsg)

-- UPDATE

update : Msg -> NewCard -> (NewCard, Cmd Msg)
update msg newCard =
  case msg of
    UpdateNewCardNumber newNum ->
        { newCard | number = formatCardNumber newNum } ! []
          |> andThen update UpdateNewCardHasError
          |> andThen update (MaybeClearErrorMessage CardNumberError)

    UpdateNewCardName newName ->
        { newCard | name = newName } ! []
          |> andThen update UpdateNewCardHasError
          |> andThen update (MaybeClearErrorMessage CardNameError)

    UpdateNewCardExpirationDate newExp ->
        { newCard | exp = formatCardExpiration newExp } ! []
          |> andThen update UpdateNewCardHasError
          |> andThen update (MaybeClearErrorMessage CardExpError)

    UpdateNewCardCVV newCVV ->
        { newCard | cvv = formatCVV newCVV } ! []
          |> andThen update UpdateNewCardHasError
          |> andThen update (MaybeClearErrorMessage CardCVVError)

    UpdateNewCardHasError ->
      if validateCardNumber newCard.number
      && validateName newCard.name
      && validateCardExp newCard.exp
      && validateCardCVV newCard.cvv
      then
        { newCard | hasError = False} ! []
      else
        { newCard | hasError = True } ! []

    UpdateNewCardShouldSave ->
      { newCard | shouldSave = not newCard.shouldSave } ! []

    MaybeClearErrorMessage errorType ->
      let
        filterOutError error =
          List.filter (\errMsg -> not (errMsg == error)) newCard.errorMessages

        removeError: (String -> Bool) -> String -> String -> (NewCard, Cmd Msg)
        removeError validator valueToTest error =
          if validator valueToTest then
            { newCard | errorMessages = filterOutError error }
            ! []
          else
            newCard ! []
      in
        case errorType of
          CardNumberError ->
              removeError validateCardNumber newCard.number cardNumberErrorMsg
          CardNameError ->
              removeError validateName newCard.name nameErrorMsg
          CardExpError ->
              removeError validateCardExp newCard.exp cardExpErrorMsg
          CardCVVError ->
              removeError validateCardCVV newCard.cvv cardCVVErrorMsg

    MaybeSetErrorMessage errorType ->
      let
        (errorString, isValid) =
          case errorType of
            CardNumberError ->
              ( cardNumberErrorMsg
              , validateCardNumber newCard.number
              )
            CardNameError ->
              ( nameErrorMsg
              , validateName newCard.name
              )
            CardExpError ->
              ( cardExpErrorMsg
              , validateCardExp newCard.exp
              )
            CardCVVError ->
              ( cardCVVErrorMsg
              , validateCardCVV newCard.cvv
              )

        errorMessageExists =
          (List.any (\errMsg -> errMsg == errorString) newCard.errorMessages)
      in
        if not isValid && not errorMessageExists then
          { newCard | errorMessages = errorString :: newCard.errorMessages } ! []
        else
          newCard ! []
