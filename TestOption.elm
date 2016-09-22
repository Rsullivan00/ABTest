module TestOption exposing (..)

import Html exposing (Html, button, div, text)
import Html.App as Html
import Html.Events exposing (onClick)

-- MODEL
type alias Model =
    { votes: Int
    , image: String
    }

init : Model
init =
  Model 0 "image_string.png"

-- UPDATE
type Msg
  = Choose

update : Msg -> Model -> Model
update msg testOption =
  case msg of
    Choose ->
      { testOption | votes = testOption.votes + 1 }

-- VIEW

view : Model -> Html Msg
view testOption =
  div [ onClick Choose ] [ text (toString testOption) ]

