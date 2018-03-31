module Model.Behavior exposing (..)

import Dict exposing (Dict)

import Model.Layer exposing (..)


type alias Behavior =
  Layer -> Layer


nonBlank layer =
  if isEmpty layer then
    Dict.singleton (sx//2, sy//2) True
  else if isFull layer then
    layer |> Dict.remove (sx//2, sy//2)
  else
    layer


shiftRight layer =
  layer
  |> Dict.foldl (\(x, y) status newLayer -> newLayer |> Dict.insert (x+1, y) status) Dict.empty


growUp layer =
  layer
  |> Dict.foldl (\(x, y) status newLayer -> newLayer |> Dict.insert (x, y-1) status) layer


leftTwin layer =
  layer
  |> Dict.foldl (\(x, y) status newLayer -> if countInRow y layer == 1 then (newLayer |> Dict.insert ((x-14+sx)%sx, y) status) else newLayer) layer


shiftDownIfTotalCountDividesBy5 layer =
  if (Dict.size layer)%5 == 0 then
    layer
    |> Dict.foldl (\(x, y) status newLayer -> newLayer |> Dict.insert (x, y+1) status) Dict.empty
  else
    layer
