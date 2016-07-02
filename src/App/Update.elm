module App.Update exposing (update, urlUpdate)

-- CORE MODULES

import Navigation
import App.Nav exposing (routerConfig)
import Hop exposing (makeUrl, setQuery, makeUrlFromLocation)
import Hop.Types exposing (Location)
import Update.Extra exposing (andThen)

-- OUR MODULES

import App.Types exposing (Model, Msg(..), Route(..))
import Components.Menu.Types as MenuTypes
import Components.Menu.Update as MenuUpdate
import Components.Cart.Types as CartTypes
import Components.Cart.Update as CartUpdate
import Components.Checkout.Update as CheckoutUpdate
import Ports.Debug exposing (debug)

-- UPDATE

update : Msg -> Model -> (Model , Cmd Msg)
update msg model =
  -- let
  --   msg = Debug.log "MSG" msg
  --   model = Debug.log "MODEL" model
  -- in
    case msg of
      NoOp ->
        model ! []

      ToggleDebugger ->
        model ! [ debug True ]

      -- NAV

      NavigateTo path ->
        let
          command =
            makeUrl routerConfig path
                |> Navigation.newUrl
        in
          ( model, command )

      SetQuery query ->
        let
          command =
            model.location
                |> setQuery query
                |> makeUrlFromLocation routerConfig
                |> Navigation.newUrl
        in
          ( model, command )

      -- MENU

      MenuMsg msg ->
        let
          (menuModel, cmd) =
            MenuUpdate.update msg { menu = model.menu, cart = model.cart }
        in
          { model | menu = menuModel.menu, cart = menuModel.cart }
          ! [ Cmd.map MenuMsg cmd ]

      -- CART

      CartMsg msg ->
        let
          (newCart, cmd) =
            CartUpdate.update msg model.cart
        in
          { model | cart = newCart }
          ! [ Cmd.map CartMsg cmd ]

      -- Checkout

      CheckoutMsg msg ->
        let
          (checkoutModel, cmd) =
            CheckoutUpdate.update msg { cart = model.cart, newCard = model.newCard }
        in
          { model | cart = checkoutModel.cart, newCard = checkoutModel.newCard }
          ! []


-- URL UPDATE

urlUpdate : ( Route , Location ) -> Model -> ( Model , Cmd Msg )
urlUpdate ( route, location ) model =
  let
    newModel =
      { model | route = route, location = location }
  in
    case route of
      NotFoundRoute
        -> newModel ! []
      MainRoute
        -> newModel ! []
      AboutRoute
        -> newModel ! []

      MenuRoute ->
        newModel ! []
          |> getMenu
          |> getCart

      CheckoutRoute route ->
        newModel ! []
          |> getCart


getMenu : (Model, Cmd Msg) -> (Model, Cmd Msg)
getMenu (model, cmd) =
  if not model.menu.isLoaded then
    andThen update (MenuMsg MenuTypes.GetMenu) (model, cmd)
  else
    (model, cmd)

getCart : (Model, Cmd Msg) -> (Model, Cmd Msg)
getCart (model, cmd) =
  if not model.cart.isLoaded then
    andThen update (CartMsg CartTypes.GetCart) (model, cmd)
  else
    (model, cmd)
