module ABTest exposing (..)

import Html exposing (Html, button, div, text)
import Html.App
import Html.Events exposing (onClick)

import TestOption

-- MODEL
type alias ABTest =
    { left: TestOption.Model
    , right: TestOption.Model
    , description: String
    }

init : ABTest
init =
  ABTest TestOption.init TestOption.init "Image comparison description"


-- UPDATE
type Msg
  = TestOptionMsg TestOption.Msg
  | Reset

update : Msg -> ABTest -> ABTest
update msg model =
  case msg of
    TestOptionMsg subMsg ->
      let
        updatedTestOption =
          TestOption.update subMsg model.left
      in
        { model | left = updatedTestOption }
    Reset ->
      init


-- VIEW


view : ABTest -> Html Msg
view model =
  div []
    [
      Html.App.map TestOptionMsg (TestOption.view model.left),
      Html.App.map TestOptionMsg (TestOption.view model.right)
    , div [] [ text model.description ]
    , button [ onClick Reset ] [ text "Reset" ]
    ]
