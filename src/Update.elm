module Update exposing (..)

import Dict exposing (Dict)

import Model exposing (..)
import Model.Ui exposing (..)
import Model.Layer exposing (..)
import Msg exposing (..)

import Debug exposing (log)


update : Msg -> Model -> (Model, Cmd Msg)
update action ({ui,layer} as model) =
  case action of
    Tick currentTime ->
      ({ model | layer = layer |> updateLayer (floor currentTime) }, Cmd.none)


updateLayer someNumber layer =
  Dict.empty
  |> Dict.insert (someNumber%40, someNumber%25) True

