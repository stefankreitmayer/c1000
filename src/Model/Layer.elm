module Model.Layer exposing (..)

import Dict exposing (Dict)

type alias Layer =
  Dict (Int, Int) Bool


initialLayer =
  Dict.empty
  |> Dict.insert (0,0) True
  |> Dict.insert (1,0) True
  |> Dict.insert (39,24) True

sx = 40 -- Layer width

sy = 25 -- Layer height


isOn x y layer =
  layer |> Dict.get (x, y) |> Maybe.withDefault False
