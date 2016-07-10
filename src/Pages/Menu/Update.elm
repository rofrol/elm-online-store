module Pages.Menu.Update exposing (update)

import Pages.Menu.Types exposing (Msg(..))
import Pages.Menu.Model exposing (Model)
import Components.Menu.Update as MenuUpdate
import Components.Cart.Update as CartUpdate

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    MenuMsg msg ->
      let
        (model', cmds) = MenuUpdate.update msg model.menu
      in
        { model | menu = model' } ! [ Cmd.map MenuMsg cmds ]

    CartMsg msg ->
      let
        (model', cmds) = CartUpdate.update msg model.cart
      in
        { model | cart = model' } ! [ Cmd.map CartMsg cmds ]
