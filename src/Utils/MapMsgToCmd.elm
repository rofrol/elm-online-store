-- AVOID USING THIS. Not currently using in app at all.

module Utils.MapMsgToCmd exposing (mapMsgToCmd)

-- CORE MODULES

import Task

mapMsgToCmd : a -> Cmd a
mapMsgToCmd msg =
  Task.perform (always msg) (always msg) (Task.succeed ())
