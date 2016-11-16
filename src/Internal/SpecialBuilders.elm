module Internal.SpecialBuilders exposing (..)

import Internal.Location exposing (..)
import Internal.Basic exposing (..)

{-|
  Creates a matrix of zeros
 -}
zero : Int -> Int -> Matrix Int
zero rows cols =
  initialize rows cols (always 0)


{-|
  Creates a square matrix
 -}
square : Int -> (Location -> a) -> Matrix a
square n f =
  initialize n n f


{-|
  Creates an identity matrix
 -}
identity : Int -> Matrix Int
identity n =
  square n (\(i, j) -> if i == j then 1 else 0)
