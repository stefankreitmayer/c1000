module View exposing (view)

import Html exposing (Html, div, button, h2, input, table, tr, td)
import Html.Attributes exposing (class, style, placeholder, value)
import Html.Events exposing (onInput, onClick)

import Model exposing (..)
import Model.Ui exposing (..)
import Model.Layer exposing (..)
import Msg exposing (..)

import VirtualDom
import Json.Encode as Json
import Debug exposing (log)


view : Model -> Html Msg
view ({ui} as model) =
  case ui.screen of
    MainScreen ->
      renderMainScreen model


renderMainScreen : Model -> Html Msg
renderMainScreen ({layer} as model) =
  [ renderLayerPanel layer
  ]
  |> div []


renderLayerPanel : Layer -> Html Msg
renderLayerPanel layer =
  -- div [] [ Html.text "everything goes here" ]
  List.range 0 (sy-1)
  |> List.map (renderRow layer)
  |> table [ class "Layer" ]


renderRow layer y =
  List.range 0 (sx-1)
  |> List.map (renderColumn layer y)
  |> tr []


renderColumn layer y x =
  td (if layer |> isOn x y then [ class "PxOn" ] else []) []
