module NumberInput exposing (Model, Msg, numberInput, update)

import Element exposing (Element, centerX, column, el, mouseOver, padding, paddingXY, rgb255, row, text)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input


type alias Model =
    { label : String
    , value : Int
    }


type Msg
    = Add Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        Add x ->
            { model | value = model.value + x }


numberInput : Model -> Element Msg
numberInput model =
    column [ Background.color (rgb255 232 232 232), padding 10 ]
        [ el [ centerX ] (text model.label)
        , valueDisplay model
        , controlPannel
        ]


valueDisplay : Model -> Element Msg
valueDisplay model =
    el
        [ centerX
        , padding 5
        , Background.color (rgb255 255 255 255)
        , Border.solid
        , Border.color (rgb255 0 0 0)
        , Border.width 1
        ]
        (text (String.fromInt model.value))


controlPannel : Element Msg
controlPannel =
    row [ paddingXY 0 10 ]
        [ addButton "<<" -10
        , addButton "<" -1
        , addButton ">" 1
        , addButton ">>" 10
        ]


addButton : String -> Int -> Element Msg
addButton label value =
    Input.button
        [ Element.width (Element.px 50)
        , Background.color (rgb255 128 128 128)
        , paddingXY 5 10
        , Font.center
        , Border.shadow { offset = ( 1.0, 1.0 ), size = 0.5, blur = 0.2, color = rgb255 0 0 0 }
        , mouseOver
            [ Border.shadow { offset = ( 0.0, 0.0 ), size = 0.0, blur = 0.0, color = rgb255 0 0 0 }
            , Border.color (rgb255 0 0 0)
            , Background.color (rgb255 64 64 64)
            ]
        ]
        { onPress = Just (Add value), label = text label }
