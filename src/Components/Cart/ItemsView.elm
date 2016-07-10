module Components.Cart.ItemsView exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- OUR MODULES

import Components.Cart.Types exposing (Cart, Msg(..))
import Components.LoadingSpinner.View as LoadingSpinner
import Components.Cart.SummaryView as CartSummaryView
import UtilsAndConstants.MakeUrl exposing (makeUrl)

-- VIEW

view : Cart -> Html Msg
view cart =
  let
    cartItemView item =
      div [ class "layout__item" ]
        [ div [ class "spread u-pb" ]
          [ span [class "spread__l"] [ text ((toString item.qty) ++ " " ++ item.name) ]
          , span [class "spread__r"] [ text ("$" ++ (toString (item.price * item.qty))) ]
          ]
        ]
  in
    div [ class "layout u-pt" ] (List.map cartItemView cart.items)
