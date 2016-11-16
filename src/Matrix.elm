
module Matrix exposing (
    Location
  , Matrix

  , encode
  , decode

  , nrows
  , ncols
  , getElem
  , setElem

  , getRow
  , getCol
  , getDiagonal
  , getMatrixAsArray
  )


import Internal.Location exposing (..)
import Internal.Basic exposing (..)
import Internal.Extras exposing (..)
