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

-- VIEW

view : Model -> Html Msg
view model =
  div [ class "u-m++" ]
    [ div [ class "u-mt u-mb+" ]
      [ h1 [ class "u-txt-c" ] [text "Elm Online Store Example"]
      , div [ class "u-txt-c u-pb" ]
        [ button [ class "btn", onClick ToggleDebugger ] [ text "DEBUG" ]
        ]
      , text ("Model: " ++ toString model)
      ]
    , pageView model model.route
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
