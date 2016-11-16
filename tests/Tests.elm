module Tests exposing (allTests)

import Test exposing (..)

import InternalTests.LocationTests exposing (locationTests)
import InternalTests.BasicTests exposing (basicTests)
import InternalTests.ArithmeticTests exposing (arithmeticTests)
import InternalTests.SpecialBuildersTests exposing (specialBuildersTests)
import InternalTests.ExtrasTests exposing (extrasTests)


allTests : Test
allTests =
  describe "The Location Module"
    [ locationTests
    , basicTests
    , arithmeticTests
    , specialBuildersTests
    , extrasTests
    ]
