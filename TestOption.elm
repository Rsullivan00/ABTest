module TestOption exposing (..)

import Html exposing (Html, button, div, text)
import Html.App as Html
import Html.Events exposing (onClick)
import Random
import Debug


-- MODEL


type alias Model =
  { votes : Int
  , image : String
  }


init : ( Model, Cmd Msg )
init =
  ( Model 0 "Image name", Cmd.none )



-- UPDATE


type Msg
  = Choose
  | Randomize
  | NewVotes Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg testOption =
  case msg of
    Choose ->
      ( { testOption | votes = testOption.votes + 1 }, Cmd.none )

    Randomize ->
      ( testOption, Random.generate NewVotes (Random.int 1 10) )

    NewVotes newVotes ->
      ( { testOption | votes = newVotes }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view testOption =
  div []
    [ div [ onClick Choose ] [ text (toString testOption) ]
    , div [ onClick Randomize ] [ text "Random" ]
    ]
