import Html exposing (Html, button, div, text)
import Html.App as App
import Html.Events exposing (onClick)
import ABTest exposing (init, view, update)


main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = (always Sub.none)
    }
