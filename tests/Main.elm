port module Main exposing (..)

import Tests exposing (allTests)
import Test.Runner.Node exposing (run)
import Json.Encode exposing (Value)


main : Program Value
main =
  run emit allTests


port emit : ( String, Value ) -> Cmd msg
