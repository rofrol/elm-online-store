module Components.Counter.Update exposing (..)

-- OUR MODULES

import Components.Counter.Types exposing (..)

-- UPDATE

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      (model + 1)

    Decrement ->
      (model - 1)
