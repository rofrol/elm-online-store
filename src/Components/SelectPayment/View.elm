module Components.SelectPayment.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App

-- OUR MODULES

import Components.SelectPayment.Model exposing (Model)
import Components.SelectPayment.Types exposing (Msg(..))
import Components.Card.NewCardFormView as NewCardFormView
import Components.Card.SavedCardView as SavedCardView
import Components.Card.Types as CardTypes

-- VIEW

view : Model -> Html Msg
view model =
  let
    formValidation =
      div [] (List.map formErrorMessage model.newCard.errorMessages)

    formErrorMessage errMsg =
      div [ class "u-txt-red" ] [ text errMsg ]

    newCardOrderButton =
      if model.newCard.hasError then
        button [ class "btn btn--disabled", disabled True ] [ text "Order Now" ]
      else
        a [ class "btn", onClick UseAndSaveNewCard, href "/#/checkout/summary" ] [ text "Order Now"]

  in
    div []
      [ div [ class "layout layout--huge" ]
        [ div [ class "layout__item u-1/2" ]
          [ h4 [ class "u-m0" ] [ text "New Card" ]
          , hr [ class "u-mb" ] []
          , App.map CardMsg (NewCardFormView.view model.newCard)
          , div [ class "spread u-mv" ]
            [ label [ class "label" ]
              [ span [ class "u-pr-" ] [ text "Save Card" ]
              , input [ type' "checkbox", checked model.newCard.shouldSave, onClick (CardMsg CardTypes.UpdateNewCardShouldSave) ] []
              ]
            , newCardOrderButton
            ]
          , formValidation
          ]
        , div [ class "layout__item u-1/2" ]
          [ h4 [ class "u-m0" ] [ text "Saved Card" ]
          , hr [ class "u-mb" ] []
          , App.map CardMsg (SavedCardView.view model.savedCard)
          ]
        ]
      ]
