module Pages.Menu.Types exposing (Msg(..))

import Components.Menu.Types as MenuTypes
import Components.Cart.Types as CartTypes

type Msg
  = MenuMsg MenuTypes.Msg
  | CartMsg CartTypes.Msg
