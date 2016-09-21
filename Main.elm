import Html exposing (Html, button, div, text)
import Html.App as Html
import Html.Events exposing (onClick)
import ABTest exposing (model, view, update)


main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }
