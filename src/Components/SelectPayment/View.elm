module Components.SelectPayment.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as App

-- OUR MODULES

import Components.SelectPayment.Model exposing (Model)
import Components.SelectPayment.Types exposing (Msg(..))
import Components.NewCardForm.View as NewCardFormView

-- VIEW

view : Model -> Html Msg
view model =
  let
    formValidation =
      div [] (List.map formErrorMessage model.newCard.errorMessages)

    formErrorMessage errMsg =
      div [ class "u-txt-red" ] [ text errMsg ]

  in
    div []
      [ div [ class "layout layout--huge" ]
        [ div [ class "layout__item u-1/2" ]
          [ h4 [ class "u-m0" ] [ text "New Card" ]
          , hr [ class "u-mb" ] []
          , App.map NewCardFormMsg (NewCardFormView.view model.newCard)
          , div [ class "spread u-mv" ]
            [ label [ class "label" ]
              [ span [ class "u-pr-" ] [ text "Save Card" ]
              , input [ type' "checkbox", value "text" ] []
              ]
            , button [ classList [("btn", not model.newCard.hasError), ("btn btn--disabled", model.newCard.hasError)], disabled model.newCard.hasError ] [ text "Order Now" ]
            ]
          , formValidation
          ]
        , div [ class "layout__item u-1/2" ]
          [ h4 [ class "u-m0" ] [ text "Saved Card" ]
          , hr [ class "u-mb" ] []
          , div [ class "spread" ]
            [ div [] [ text "Card ending in 2456" ]
            , button [ class "btn" ] [ text "Order Now" ]
            ]
          ]
        ]
      ]
