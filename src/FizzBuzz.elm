module FizzBuzz where

import StartApp.Simple
-- import Task exposing (Task)
import Signal exposing (Signal, Address)
-- import Effects exposing (Effects, Never)
import Html exposing (..)
import Html.Events exposing (onClick, onKeyPress)

--
-- StartApp boilerplate
--
app =
  StartApp.Simple.start { model = 0, view = view, update = update }

main : Signal Html
main =
  app

-- port tasks : Signal (Task Never ())
-- port tasks =
--   app.tasks

--
-- My type declarations
--
type alias Model = Int

type Action = Increment | Decrement | Reset | ResetTo Int

--
-- My functions
--


update : Action -> Model -> Model
update action model =
  case action of
    Increment -> model + 1
    Decrement -> model - 1
    Reset -> 0
    ResetTo n -> n

-- Html.text model
view : Address Action -> Model -> Html
view address model =
  div []
    [ button [ onClick address Decrement ] [ text "-" ]
    , div [  ] [ text (toString model) ]
    , button [ onClick address Increment ] [ text "+" ]
    , button [ onClick address Reset ] [ text "Reset" ]
    , input [ onKeyPress address ResetTo ] []
    ]
