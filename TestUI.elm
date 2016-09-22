module TestUI exposing (..)

import Html exposing (Html, button, div, text)
import Html.App exposing (map, beginnerProgram)
import Html.Events exposing (onClick)

import ABTest

-- MODEL
type alias TestUI =
    { test: ABTest.ABTest
    }

model : TestUI
model =
  TestUI ABTest.model

-- UPDATE
-- type Msg
--   = Next

update msg model =
  case msg of
    _ ->
      model

-- View
view model =
  div []
    [
      ABTest.view model.test
    ]

main =
  beginnerProgram
    { model = model
    , view = view
    , update = update
    }
