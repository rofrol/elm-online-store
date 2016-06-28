module App.View exposing (view)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App

-- OUR MODULES

import App.Types exposing (Model, Msg(..), Route(..))
import Components.Home.View as Home
import Components.Menu.View as Menu
import Components.Checkout.View as Checkout

-- VIEW

view : Model -> Html Msg
view model =
  let
    debugButtonStyles =
      [ ("position", "absolute")
      , ("top", "0")
      , ("left", "0")
      ]
  in
    div []
      [ div [ style debugButtonStyles ]
        [ button [ class "btn", onClick ToggleDebugger ] [ text "DEBUG" ]
        ]
      , div [ class "u-m++" ]
        [ div [ class "u-mt u-mb+" ]
          [ h1 [ class "u-txt-c" ] [text "Elm Online Store Example"]
          ]
        , pageView model model.route
        ]
      ]

pageView : Model -> Route -> Html Msg
pageView model route =
  case route of
    MainRoute ->
      Home.view

    AboutRoute ->
      div [ ] [ text "About Route" ]

    NotFoundRoute ->
      div [ ] [ text "Route Not Found" ]

    MenuRoute ->
      App.map MenuMsg (Menu.view model.menu)

    CheckoutRoute route ->
      App.map CheckoutMsg (Checkout.view route model.menu.cart)
