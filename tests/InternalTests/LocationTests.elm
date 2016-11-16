module InternalTests.LocationTests exposing (locationTests)

import Test exposing (..)
import Fuzz exposing (intRange)
import Expect

import Internal.Location exposing (..)


locationTests : Test
locationTests =
  describe "The Location Module"
    [ fuzz2 (intRange 1 1000) (intRange 1 1000) "encode is decodes inverse" <|
      \index cols ->
        index
        |> decode cols
        |> encode cols
        |> Expect.equal index
    , fuzz3 (intRange 1 1000) (intRange 1 1000) (intRange 1 1000) "decode is encodes inverse" <|
      \i fuz1 fuz2 ->
        let
          j = min fuz1 fuz2
          cols = max fuz1 fuz2 + 1
        in
          (i, j)
          |> encode cols
          |> decode cols
          |> Expect.equal (i, j)
    ]
