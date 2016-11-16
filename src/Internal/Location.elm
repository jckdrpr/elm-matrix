module Internal.Location exposing (
    Location
  , encode
  , decode
  )

{-|
  A type alias for matrix indexing.
 -}
type alias Location =
  (Int, Int)


{-|
  Encode an integer as a location.
 -}
encode : Int -> Location -> Int
encode totalCols (i, j) =
  (i - 1) * totalCols + (j - 1)


{-|
  Decode a Location object from an integer.
 -}
decode : Int -> Int -> Location
decode totalCols k =
  (k // totalCols + 1, k % totalCols + 1)
