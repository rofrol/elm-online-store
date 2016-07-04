module Components.Card.Update exposing (update)

-- CORE MODULES

import Update.Extra exposing (andThen)

-- OUR MODULES

import Components.Card.Types exposing (..)
import UtilsAndConstants.Format exposing (formatCardNumber, formatCardExpiration, formatCVV)
import UtilsAndConstants.FormValidators exposing (validateCardNumber, validateName, validateCardExp, validateCardCVV)
import UtilsAndConstants.Errors exposing (cardNumberErrorMsg, nameErrorMsg, cardExpErrorMsg, cardCVVErrorMsg)
import Components.Card.Api exposing (saveCard, getSavedCard)
import Components.Card.Model exposing (Model)

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  let
    savedCard = fst model
    newCard = snd model
  in
    case msg of
      SaveCard ->
        ( savedCardLoading, newCard ) ! [ saveCard newCard ]

      GetSavedCard ->
        ( savedCardLoading, newCard ) ! [ getSavedCard ]

      UpdateSavedCardSuccess response ->
        ( { savedCard
          | number = response.number
          , name = response.name
          , exp = response.exp
          , cvv = response.cvv
          , isLoading = False
          , isLoaded = True
          }
        , newCard
        ) ! []

      UpdateSavedCardFail error ->
        model ! []

      UpdateNewCardNumber newNum ->
          ( savedCard , { newCard | number = formatCardNumber newNum } ) ! []
            |> andThen update UpdateNewCardHasError
            |> andThen update (MaybeClearErrorMessage CardNumberError)

      UpdateNewCardName newName ->
          ( savedCard , { newCard | name = newName } ) ! []
            |> andThen update UpdateNewCardHasError
            |> andThen update (MaybeClearErrorMessage CardNameError)

      UpdateNewCardExpirationDate newExp ->
          ( savedCard , { newCard | exp = formatCardExpiration newExp } ) ! []
            |> andThen update UpdateNewCardHasError
            |> andThen update (MaybeClearErrorMessage CardExpError)

      UpdateNewCardCVV newCVV ->
          ( savedCard , { newCard | cvv = formatCVV newCVV } ) ! []
            |> andThen update UpdateNewCardHasError
            |> andThen update (MaybeClearErrorMessage CardCVVError)

      UpdateNewCardHasError ->
        if validateCardNumber newCard.number
        && validateName newCard.name
        && validateCardExp newCard.exp
        && validateCardCVV newCard.cvv
        then
          ( savedCard , { newCard | hasError = False} ) ! []
        else
          ( savedCard , { newCard | hasError = True } ) ! []

      MaybeClearErrorMessage errorType ->
        let
          filterOutError error =
            List.filter (\errMsg -> not (errMsg == error)) newCard.errorMessages

          removeError: (String -> Bool) -> String -> String -> (Model, Cmd Msg)
          removeError validator valueToTest error =
            if validator valueToTest then
              ( savedCard, { newCard | errorMessages = filterOutError error })
              ! []
            else
              model ! []
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
          if not isValid && not errorMessageExists
          then
            ( savedCard,
            { newCard | errorMessages = errorString :: newCard.errorMessages }
            )
            ! []
          else
            model ! []

savedCardLoading : SavedCard
savedCardLoading =
  SavedCard "" "" "" "" True False False ""
