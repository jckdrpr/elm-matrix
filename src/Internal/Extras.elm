module Internal.Extras exposing (..)

import Array as A

import Internal.Basic exposing (Matrix, unsafeGetElem)

-------------------------------------------------------
-- SPECIAL READS --------------------------------------
-------------------------------------------------------


{-|
  Gets the ith row for a given matrix.
 -}
getRow : Int -> Matrix a -> Maybe (A.Array a)
getRow ith ({ncols, values, nrows} as matrix) =
  let
    startIdx = (ith - 1) * ncols
    maxIndex = (nrows - 1) * ncols
  in
    if startIdx <= maxIndex then
      Just <| A.slice startIdx (startIdx + ncols) values
    else
      Nothing


{-|
  Gets the jth column for a given matrix
 -}
getCol : Int -> Matrix a -> Maybe (A.Array a)
getCol jth ({ncols, values, nrows} as matrix) =
  if jth - 1 < ncols then
    Just <| A.initialize nrows (\i -> unsafeGetElem (i, jth - 1) matrix)
  else
    Nothing


{-|
  Gets the diagonal of a matrix
 -}
getDiagonal : Matrix a -> A.Array a
getDiagonal ({nrows, ncols} as matrix) =
  let
    diagSize = min nrows ncols
  in
    A.initialize diagSize (\i -> unsafeGetElem (i + 1, i + 1) matrix)


-------------------------------------------------------
-- CONVERSION -----------------------------------------
-------------------------------------------------------
{-|
  Create a matrix from an array
 -}
fromArray : Int -> Int -> A.Array a
fromArray =
  Debug.crash "UNIMPLEMENTED"

{-|
  Convert a given matrix to an array
 -}
toArray : Matrix a -> A.Array a
toArray ({values}) =
  values

{-|
  Create a matrix from a List
 -}
fromList : Int -> Int -> List a
fromList =
  Debug.crash "UNIMPLEMENTED"

{-|
  Convert a given matrix to a list
 -}
toList : Matrix a -> List a
toList ({values}) =
  A.toList values


-------------------------------------------------------
-- PRINTING -------------------------------------------
-------------------------------------------------------

prettyMatrix : Matrix a -> String
prettyMatrix =
  Debug.crash "UNIMPLEMENTED"
