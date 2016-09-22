import Html exposing (Html, button, div, text)
import Html.App as Html
import Html.Events exposing (onClick)
import ABTest exposing (init, view, update)


main =
  Html.beginnerProgram
    { model = init
    , view = view
    , update = update
    }
