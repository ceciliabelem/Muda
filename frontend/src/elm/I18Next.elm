module I18Next exposing
    ( Translations, Delims(..), Replacements, initialTranslations
    , t, tr
    , translationsDecoder
    )

{-| This library provides a solution to load and display translations in your
app. It allows you to load json translation files, display the text and
interpolate placeholders. There is also support for fallback languages if
needed.


# Types and Data

@docs Translations, Delims, Replacements, initialTranslations


# Using Translations

@docs t, tr


# Fetching and Decoding

@docs fetchTranslations, translationsDecoder

-}

import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)


type Tree
    = Branch (Dict String Tree)
    | Leaf String


{-| A type that represents your loaded translations
-}
type Translations
    = Translations (Dict String String)


{-| A union type for representing delimiters for placeholders. Most commonly
those will be `{{...}}`, or `__...__`. You can also provide a set of
custom delimiters(start and end) to account for different types of placeholders.
-}
type Delims
    = Curly


{-| An alias for replacements for use with placeholders. Each tuple should
contain the name of the placeholder as the first value and the value for
the placeholder as the second entry. See [`tr`](I18Next#tr) for usage examples.
-}
type alias Replacements =
    List ( String, String )


{-| Use this to initialize Translations in your model. This may be needed
when loading translations but you need to initialize your model before
your translations are fetched.
-}
initialTranslations : Translations
initialTranslations =
    Translations Dict.empty


{-| Decode a JSON translations file. The JSON can be arbitrarly nested, but the
leaf values can only be strings. Use this decoder directly if you are passing
the translations JSON into your elm app via flags or ports. If you are
loading your JSON file via Http use
[`fetchTranslations`](I18Next#fetchTranslations) instead.
After decoding nested values will be available with any of the translate
functions separated with dots.

The JSON could look like this:

    [
        {
            "buttons": {
                "save": "Save",
                "cancel": "Cancel"
            },
            "greetings": {
                "hello": "Hello",
                "goodDay": "Good Day {{firstName}} {{lastName}}"
            }
        }
    ]

    -- Use the decoder like this on a string
    import I18Next exposing (translationsDecoder)
    Json.Decode.decodeString translationsDecoder "{ "greet": "Hello" }"
    -- or on a Json.Encode.Value
    Json.Decode.decodeValue translationsDecoder encodedJson

-}
translationsDecoder : Decoder Translations
translationsDecoder =
    Decode.map mapTreeToDict treeDecoder


treeDecoder : Decoder Tree
treeDecoder =
    Decode.oneOf
        [ Decode.string |> Decode.map Leaf
        , Decode.lazy
            (\_ -> Decode.dict treeDecoder |> Decode.map Branch)
        ]


foldTree : Dict String String -> Dict String Tree -> String -> Dict String String
foldTree initialValue dict namespace =
    Dict.foldl
        (\key val acc ->
            let
                newNamespace currentKey =
                    if String.isEmpty namespace then
                        currentKey

                    else
                        namespace ++ "." ++ currentKey
            in
            case val of
                Leaf str ->
                    Dict.insert (newNamespace key) str acc

                Branch children ->
                    foldTree acc children (newNamespace key)
        )
        initialValue
        dict


mapTreeToDict : Tree -> Translations
mapTreeToDict tree =
    case tree of
        Branch dict ->
            foldTree Dict.empty dict ""
                |> Translations

        _ ->
            initialTranslations


{-| Translate a value at a given string.
{- If your translations are { "greet": { "hello": "Hello" } }
use dots to access nested keys.
-}
import I18Next exposing (t)
t translations "greet.hello" -- "Hello"
-}
t : Translations -> String -> String
t (Translations translations) key =
    Dict.get key translations |> Maybe.withDefault key


replacePlaceholders : Replacements -> Delims -> String -> String
replacePlaceholders replacements delims string =
    let
        ( start, end ) =
            delimsToTuple delims
    in
    List.foldl
        (\( key, value ) acc ->
            String.replace (start ++ key ++ end) value acc
        )
        string
        replacements


delimsToTuple : Delims -> ( String, String )
delimsToTuple delims =
    case delims of
        Curly ->
            ( "{{", "}}" )


{-| Translate a value at a key, while replacing placeholders, and trying
different fallback languages. Check the [`Delims`](I18Next#Delims) type for
reference how to specify placeholder delimiters.
Use this when you need to replace placeholders.
-- If your translations are { "greet": "Hello {{name}}" }
import I18Next exposing (tr, Delims(..))
tr translations Curly "greet" [("name", "Peter")]
-}
tr : Translations -> Delims -> String -> Replacements -> String
tr (Translations translations) delims key replacements =
    Dict.get key translations
        |> Maybe.map (replacePlaceholders replacements delims)
        |> Maybe.withDefault key
