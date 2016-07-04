module Components.Card.NewCardFormView exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput, onBlur)

-- OUR MODULES

import Components.Card.Types exposing (..)

-- VIEW

view : NewCard -> Html Msg
view card =
  div []
    [ div [ class "form" ]
      [ div [ class "field-set" ]
        [ div [ class "field-set__labels" ]
          [ div [] [ text "Card Number" ]
          , div [] [ text "Name on Card" ]
          ]
        , div [ class "field-set__fields" ]
          [ input
            [ value card.cardNumber, maxlength 19, onInput UpdateNewCardNumber, onBlur (MaybeSetErrorMessage CardNumberError)
            ] []
          , input [ onInput UpdateNewCardName, onBlur (MaybeSetErrorMessage CardNameError) ] []
          ]
        ]
      , div [ class "field-row" ]
        [ div [] [ text "Expiration Date" ]
        , input [ value card.exp, maxlength 5, onInput UpdateNewCardExpirationDate, onBlur (MaybeSetErrorMessage CardExpError) ] []
        , div [] [ text "CVV" ]
        , input [ value card.cvv, maxlength 4, onInput UpdateNewCardCVV, onBlur (MaybeSetErrorMessage CardCVVError) ] []
        ]
      ]
    ]
