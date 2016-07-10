module Pages.Menu.View exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App

-- OUR MODULES

import Pages.Menu.Model exposing (Model)
import Pages.Menu.Types exposing (Msg(..))
import Components.Menu.Types as MenuTypes
import Components.Cart.Types as CartTypes
import Components.Cart.View as CartView
import Components.LoadingSpinner.View as LoadingSpinnerView
import Components.AsyncButton.View as AsyncButtonView

-- VIEW

view : Model -> Html Pages.Menu.Types.Msg
view model =
  let
    menu = model.menu
    cart = model.cart

    decrementQtyClass qty =
      let baseClass =
        "btn btn--small u-mr"
      in
        if qty == 0 then
          baseClass ++ " u-invisible"
        else
          baseClass

    menuItem item =
      div [ class "layout__item u-1/2 u-pb++ u-pr++" ]
        [ h2 [] [ text item.name ]
        , h3 [] [ text ("$" ++ (toString item.price) ) ]
        , div [ class "u-pv" ]
          [ button [ class (decrementQtyClass item.qty), onClick (MenuMsg <| MenuTypes.DecrementItemQty <| item.id) ] [ text "-" ]
          , span [] [ text (toString item.qty) ]
          , button [ class ("btn btn--small u-ml"), onClick (MenuMsg <| MenuTypes.IncrementItemQty <| item.id) ] [ text "+" ]
          ]
        , AsyncButtonView.view
            cart.isLoading
            (CartMsg <| CartTypes.AddItemToCart <| buildItemPayload <| item)
            "Add Item"
        ]

    buildItemPayload item =
      CartTypes.ItemPayload item.id item.qty

  in
    div []
      [ div [ class "layout" ]
        [ div [ class "layout__item u-4/5 u-p"]
          [ h1 [] [ text "Menu" ]
          , div [ class "layout" ]
            (List.map menuItem menu.items)
          , LoadingSpinnerView.view menu.isLoading Nothing
          ]
        , div [ class "layout__item u-1/5 u-p"]
          [ App.map CartMsg (CartView.view cart)
          ]
        ]
      ]
