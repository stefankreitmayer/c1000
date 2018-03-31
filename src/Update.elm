module Update exposing (..)

import Dict exposing (Dict)

import Model exposing (..)
import Model.Ui exposing (..)
import Model.Layer exposing (..)
import Msg exposing (..)

import Debug exposing (log)


update : Msg -> Model -> (Model, Cmd Msg)
update action ({ui,layer,behaviors} as model) =
  case action of
    Tick currentTime ->
      ({ model | layer = layer |> applyBehaviors behaviors }, Cmd.none)


applyBehaviors behaviors layer =
  behaviors
  |> List.foldl (\behavior l -> l |> behavior) layer
  |> trimLayer
