module Components.Cart.ItemsView exposing (..)

-- CORE MODULES

import Html exposing (..)
import Html.Attributes exposing (..)

-- OUR MODULES

import Components.Cart.Types exposing (Cart, Msg(..))

-- VIEW

view : Cart -> Html a
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
