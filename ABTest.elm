module ABTest exposing (..)

import Html exposing (Html, button, div, text)
import Html.App
import Html.Events exposing (onClick)
import TestOption


-- MODEL


type alias ABTest =
  { left : TestOption.Model
  , right : TestOption.Model
  , description : String
  }


init : ( ABTest, Cmd Msg )
init =
  ( ABTest
      (fst TestOption.init)
      (fst TestOption.init)
      "Image comparison description"
  , Cmd.none
  )



-- UPDATE


type Msg
  = Left TestOption.Msg
  | Right TestOption.Msg
  | Reset


update : Msg -> ABTest -> ( ABTest, Cmd Msg )
update msg model =
  case msg of
    Left subMsg ->
      let
        updatedTestOption =
          TestOption.update subMsg model.left
      in
        ( { model | left = fst updatedTestOption }
        , Cmd.map Left (snd updatedTestOption)
        )

    Right subMsg ->
      let
        updatedTestOption =
          TestOption.update subMsg model.right
      in
        ( { model | right = fst updatedTestOption }
        , Cmd.map Right (snd updatedTestOption)
        )

    Reset ->
      init



-- VIEW


view : ABTest -> Html Msg
view model =
  div []
    [ Html.App.map Left (TestOption.view model.left)
    , Html.App.map Right (TestOption.view model.right)
    , div [] [ text model.description ]
    , button [ onClick Reset ] [ text "Reset" ]
    ]
