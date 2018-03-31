module Model.Behavior exposing (..)

import Dict exposing (Dict)
import Debug exposing (log)

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


shiftRight n layer =
  layer
  |> Dict.foldl (\(x, y) status newLayer -> newLayer |> Dict.insert (x+n, y) status) Dict.empty


shiftDown n layer =
  layer
  |> Dict.foldl (\(x, y) status newLayer -> newLayer |> Dict.insert (x, y+n) status) Dict.empty


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


shiftTowardsCenter layer =
  let
      balance =
        ( (layer |> Dict.keys |> List.map Tuple.first |> List.sum) // (Dict.size layer) |> toFloat ) / (toFloat sy) - 0.5
  in
     layer |> shiftRight (balance * -2 |> round)
