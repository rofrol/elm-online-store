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
      if (model - 1) < 0 then
        model
      else
        (model - 1)
