module Model exposing (..)

import Set

import Model.Ui exposing (..)
import Model.Layer exposing (..)


type alias Model =
  { ui : Ui
  , layer : Layer }


initialModel : Model
initialModel =
  { ui = initialUi
  , layer = initialLayer }
