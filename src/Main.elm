module Main exposing (..)

import Html exposing (Html)

import Model exposing (Model,initialModel)
import Update exposing (update)
import View exposing (view)
import Msg exposing (subscriptions)

--------------------------------------------------------------------------- MAIN

main : Program Never Model Msg.Msg
main =
  Html.program
  { init = (initialModel, Cmd.none)
  , update = update
  , view = view
  , subscriptions = subscriptions }
