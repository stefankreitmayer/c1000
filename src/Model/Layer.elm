module Model.Layer exposing (..)

import Dict exposing (Dict)

type alias Layer =
  Dict (Int, Int) Bool


initialLayer =
  Dict.empty

sx = 40 -- Layer width

sy = 25 -- Layer height


isOn x y layer =
  layer |> Dict.get (x, y) |> Maybe.withDefault False


isEmpty layer =
  layer |> trimLayer |> Dict.isEmpty


isFull layer =
  (layer |> trimLayer |> Dict.size) == sx * sy


trimLayer layer =
  layer |> Dict.filter (\(x, y) _ -> isInBounds x y)


isInBounds x y =
  x>=0 && x<sx && y>=0 && y<sy


countInRow y layer =
  layer
  |> Dict.filter (\(_, ly) _ -> ly == y)
  |> Dict.size
