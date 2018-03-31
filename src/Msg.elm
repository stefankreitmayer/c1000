module Msg exposing (..)

import Time exposing (Time)

import Model exposing (..)
import Model.Ui exposing (..)


type Msg
  = Tick Time


subscriptions : Model -> Sub Msg
subscriptions {ui} =
  [ Time.every (500 * Time.millisecond) Tick
  ] |> Sub.batch
