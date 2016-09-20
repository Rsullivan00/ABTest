import Html exposing (Html, button, div, text)
import Html.App as Html
import Html.Events exposing (onClick)



main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL

type alias ABChoice =
    { votes: Int
    , image: String
    }

type alias ABTest =
    { left: ABChoice
    , right: ABChoice
    , description: String
    }

choiceA: ABChoice
choiceA =
  ABChoice 0 "image_a.png"

choiceB: ABChoice
choiceB =
  ABChoice 0 "image_b.png"

model : ABTest
model =
  ABTest choiceA choiceB "Image comparison description"

type Side
  = Left
  | Right



-- UPDATE


type Msg
  = ChooseLeft
  | ChooseRight
  | Reset

update : Msg -> ABTest -> ABTest
update msg model =
  case msg of
    ChooseLeft ->
      { model | left = ABChoice (model.left.votes + 1) model.left.image }
    ChooseRight ->
      { model | right = ABChoice (model.right.votes + 1) model.right.image }
    Reset ->
      ABTest choiceA choiceB model.description


-- VIEW


view : ABTest -> Html Msg
view model =
  div []
    [
      div [ onClick ChooseLeft ] [ text "left image" ]
    , div [ onClick ChooseRight ] [ text "right image" ]
    , div [] [ text (toString model) ]
    , button [ onClick Reset ] [ text "Reset" ]
    ]
