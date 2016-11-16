module InternalTests.BasicTests exposing (basicTests)

import Test exposing (..)
import Fuzz exposing (intRange, int)
import Expect

import Internal.Basic exposing (..)

basicTests : Test
basicTests =
  describe "The Basic Matrix Module"
    [ fuzz2 (intRange 1 100) (intRange 1 100) "nrows returns rows of a matrix" <|
      \rows cols ->
        initialize rows cols (always 1)
        |> nrows
        |> Expect.equal rows
    , fuzz2 (intRange 1 100) (intRange 1 100) "ncols returns cols of a matrix" <|
      \rows cols ->
        initialize rows cols (always 1)
        |> ncols
        |> Expect.equal cols
    , fuzz5 (intRange 1 100) (intRange 1 100) (intRange 1 100) (intRange 1 100) int "getElem" <|
      \a b c d e ->
        let
          (i, j, rows, cols) = (min a b, min c d, max a b, max c d)
        in
          initialize rows cols (always e)
          |> getElem (i, j)
          |> Expect.equal (Just e)
    ]
