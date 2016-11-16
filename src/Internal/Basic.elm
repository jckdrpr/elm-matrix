module Internal.Basic exposing (
    Matrix
  , initialize
  , nrows
  , ncols
  , getElem
  , setElem
  , unsafeGetElem
  )

import Array as A exposing (Array)

import Internal.Location exposing (..)


{-|
  The type representing a m * n  2d matrix.
 -}
type alias Matrix a =
  { nrows : Int
  , ncols : Int
  , values : Array a
  }


{-|
  Returns the number of rows in a given matrix. O(1)
 -}
nrows : Matrix a -> Int
nrows =
  (.nrows)


{-|
  Returns the number of cols in a given matrix. O(1)
 -}
ncols : Matrix a -> Int
ncols =
  (.ncols)


----------------------------------------------------------
-- INITIALIZING ------------------------------------------
----------------------------------------------------------

initialize : Int -> Int -> (Location -> a) -> Matrix a
initialize rows cols f =
  { nrows = rows
  , ncols = cols
  , values = A.initialize (rows * cols) (\index -> f (decode cols index))
  }


----------------------------------------------------------
-- ACCESSING ---------------------------------------------
----------------------------------------------------------

{-|
  Based on the index gets the element at that location.

  O(1) (Not really but close). Get an element of a matrix. Indices range from (1,1) to (n,m).
  It returns Nothing if the requested element is outside of range.
 -}
getElem : Location -> Matrix a -> Maybe a
getElem (i, j) ({ncols, values} as matrix) =
  A.get (encode ncols (i, j)) values


-- | Only for internal use
unsafeGetElem : Location -> Matrix a -> a
unsafeGetElem (i, j) matrix =
  case getElem (i, j) matrix of
    Just x ->
      x

    Nothing ->
      Debug.crash "unsafe element access out of bounds"



-------------------------------------------------------
-- MANIPULATING MATRICES ------------------------------
-------------------------------------------------------

{-|
  Sets an element for a given location in the matrix. If any index (row or col) is out of
  range the matrix is unaltered
 -}
setElem : a -> Location -> Matrix a -> Matrix a
setElem value (i, j) ({values, ncols} as matrix) =
  { matrix | values = A.set (encode ncols (i, j)) value values }
