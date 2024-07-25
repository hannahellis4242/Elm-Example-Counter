module Main exposing (main)

import Browser
import Element exposing (Element, column, layout, map, spacingXY)
import Html exposing (Html)
import NumberInput as NI


type Msg
    = NumberInputMsg1 NI.Msg
    | NumberInputMsg2 NI.Msg


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Model =
    { value1 : NI.Model
    , value2 : NI.Model
    }


init : Model
init =
    { value1 = { label = "number 1", value = 0 }, value2 = { label = "number 2", value = 0 } }


update : Msg -> Model -> Model
update msg model =
    case msg of
        NumberInputMsg1 numberInputMsg ->
            { model | value1 = NI.update numberInputMsg model.value1 }

        NumberInputMsg2 numberInputMsg ->
            { model | value2 = NI.update numberInputMsg model.value2 }


view : Model -> Html Msg
view model =
    layout [] (viewElement model)


viewElement : Model -> Element Msg
viewElement model =
    column [ spacingXY 0 20 ]
        [ map NumberInputMsg1 (NI.numberInput model.value1)
        , map NumberInputMsg2 (NI.numberInput model.value2)
        ]
