module Model exposing (..)

import Set

import Model.Ui exposing (..)
import Model.Layer exposing (..)
import Model.Behavior as Behavior exposing (Behavior)


type alias Model =
  { ui : Ui
  , layer : Layer
  , behaviors : List Behavior }


initialModel : Model
initialModel =
  { ui = initialUi
  , layer = initialLayer
  , behaviors = [ Behavior.shiftRight 1, Behavior.growUp, Behavior.leftTwin, Behavior.shiftDownIfTotalCountDividesBy5, Behavior.shiftTowardsCenter, Behavior.nonBlank ] }
