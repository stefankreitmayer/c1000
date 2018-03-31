module Model.Ui exposing (..)

import Set exposing (Set)


type alias Ui =
  { screen : Screen }


type Screen = MainScreen

initialUi : Ui
initialUi =
  { screen = MainScreen }
