module Components.NewCardForm.Update exposing (update)

-- CORE MODULES

import Update.Extra exposing (andThen)

-- OUR MODULES

import Components.NewCardForm.Types exposing (..)
import GeneralTypes.NewCard exposing (NewCard)
import UtilsAndConstants.Format exposing (formatCardNumber, formatCardExpiration, formatCVV)
import UtilsAndConstants.FormValidators exposing (validateCardNumber, validateName, validateCardExp, validateCardCVV)
import UtilsAndConstants.Errors exposing (cardNumberErrorMsg, nameErrorMsg, cardExpErrorMsg, cardCVVErrorMsg)

-- UPDATE

update : Msg -> NewCard -> (NewCard, Cmd Msg)
update msg model =
  case msg of
    UpdateCardNumber newNum ->
      { model | cardNumber = formatCardNumber newNum } ! []
        |> andThen update UpdateHasError
        |> andThen update (MaybeClearErrorMessage CardNumberError)

    UpdateName newName ->
      { model | name = newName } ! []
        |> andThen update UpdateHasError
        |> andThen update (MaybeClearErrorMessage CardNameError)

    UpdateExpirationDate newExp ->
      { model | exp = formatCardExpiration newExp } ! []
        |> andThen update UpdateHasError
        |> andThen update (MaybeClearErrorMessage CardExpError)

    UpdateCVV newCVV ->
      { model | cvv = formatCVV newCVV } ! []
        |> andThen update UpdateHasError
        |> andThen update (MaybeClearErrorMessage CardCVVError)

    UpdateHasError ->
      if validateCardNumber model.cardNumber
      && validateName model.name
      && validateCardExp model.exp
      && validateCardCVV model.cvv
      then
        { model | hasError = False } ! []
      else
        { model | hasError = True } ! []

    MaybeClearErrorMessage errorType ->
      let
        filterOutError : (String -> Bool) -> String -> String -> (NewCard, Cmd Msg)
        filterOutError validator valueToTest message =
          if (validator valueToTest) then
            { model | errorMessages = List.filter
              (\errMsg -> not (errMsg == message))
              model.errorMessages
            } ! []
          else
            model ! []
      in
        case errorType of
          CardNumberError ->
              filterOutError validateCardNumber model.cardNumber cardNumberErrorMsg
          CardNameError ->
              filterOutError validateName model.name nameErrorMsg
          CardExpError ->
              filterOutError validateCardExp model.exp cardExpErrorMsg
          CardCVVError ->
              filterOutError validateCardCVV model.cvv cardCVVErrorMsg

    MaybeSetErrorMessage errorType ->
      let
        (errorString, isError) =
          case errorType of
            CardNumberError ->
              ( cardNumberErrorMsg
              , not (validateCardNumber model.cardNumber)
              )
            CardNameError ->
              ( nameErrorMsg
              , not (validateName model.name)
              )
            CardExpError ->
              ( cardExpErrorMsg
              , not (validateCardExp model.exp)
              )
            CardCVVError ->
              ( cardCVVErrorMsg
              , not (validateCardCVV model.cvv)
              )
      in
        if isError
        && not (List.any (\errMsg -> errMsg == errorString) model.errorMessages) then
          { model | errorMessages = errorString :: model.errorMessages}
          ! []
        else
          model ! []
