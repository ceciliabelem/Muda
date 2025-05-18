module Page.Notification exposing (Model, Msg(..), init, msgToString, update, view)

import Cambiatus.Scalar exposing (DateTime)
import Eos
import Eos.Account as Eos
import FormatNumber
import FormatNumber.Locales exposing (usLocale)
import Graphql.Http
import Html exposing (Html, div, img, p, text)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Log
import Notification exposing (History, MintData, NotificationType(..), OrderData, TransferData)
import Page
import RemoteData exposing (RemoteData)
import Route
import Session.LoggedIn as LoggedIn exposing (External)
import Session.Shared exposing (Shared)
import UpdateResult as UR
import Utils
import View.Components



-- INIT


init : LoggedIn.Model -> UpdateResult
init loggedIn =
    UR.init initModel
        |> UR.addExt
            (LoggedIn.query loggedIn
                (Notification.notificationHistoryQuery loggedIn.accountName)
                CompletedLoadNotificationHistory
            )



-- MODEL


type alias Model =
    Status


initModel : Model
initModel =
    Loading


type Status
    = Loading
    | Loaded (List History)


type Payload
    = T TransferData
    | S OrderData
    | M



-- VIEW


view : LoggedIn.Model -> Model -> { title : String, content : Html Msg }
view ({ shared } as loggedIn) model =
    let
        content =
            case model of
                Loading ->
                    Page.fullPageLoading shared

                Loaded notifications ->
                    div []
                        [ Page.viewHeader loggedIn (shared.translators.t "notifications.title")
                        , div [ class "container mx-auto px-4 mb-6" ]
                            [ if notifications == [] then
                                viewEmptyNotifications loggedIn.shared

                              else
                                viewNotifications loggedIn notifications
                            ]
                        ]
    in
    { title = shared.translators.t "notifications.title"
    , content = content
    }


viewNotifications : LoggedIn.Model -> List History -> Html Msg
viewNotifications loggedIn notifications =
    div [ class "shadow-md rounded-lg bg-white mt-5" ]
        (List.map (viewNotification loggedIn) notifications)


viewNotification : LoggedIn.Model -> History -> Html Msg
viewNotification loggedIn notification =
    let
        isReadIndicator =
            if notification.isRead then
                ""

            else
                " bg-orange-100 first:rounded-t-lg last:rounded-b-lg"
    in
    case notification.payload of
        Transfer data ->
            div [ class ("border-b last:border-b-0 border-gray-500 hover:bg-gray-100" ++ isReadIndicator) ]
                [ viewNotificationTransfer loggedIn.shared notification data ]

        Mint data ->
            div [ class ("border-b last:border-b-0 border-gray-500 hover:bg-gray-100" ++ isReadIndicator) ]
                [ viewNotificationMint loggedIn.shared notification data ]

        SaleHistory data ->
            div [ class ("border-b last:border-b-0 border-gray-500 hover:bg-gray-100" ++ isReadIndicator) ]
                [ viewNotificationSaleHistory loggedIn notification data ]


viewNotificationTransfer : Shared -> History -> TransferData -> Html Msg
viewNotificationTransfer shared history notification =
    let
        isReceive =
            Eos.nameToString history.recipientId /= notification.fromId

        amount =
            if isReceive then
                notification.amount

            else
                notification.amount * -1

        maybeLogo =
            if String.isEmpty notification.community.logo then
                Nothing

            else
                Just notification.community.logo

        description =
            if isReceive then
                [ ( "user", notification.fromId )
                , ( "amount", String.fromFloat notification.amount )
                ]
                    |> shared.translators.tr "notifications.transfer.receive"

            else
                [ ( "user", notification.toId )
                , ( "amount", String.fromFloat notification.amount )
                ]
                    |> shared.translators.tr "notifications.transfer.sent"
    in
    div
        [ class "flex items-start lg:items-center p-4"
        , onClick (MarkAsRead history.id (T notification))
        ]
        [ div [ class "flex-none" ]
            [ case maybeLogo of
                Just logoUrl ->
                    img
                        [ class "w-10 h-10 object-scale-down"
                        , src logoUrl
                        ]
                        []

                Nothing ->
                    div
                        [ class "w-10 h-10 object-scale-down" ]
                        []
            ]
        , div [ class "flex-col flex-grow-1 pl-4" ]
            [ p
                [ class "text-black" ]
                [ text description ]
            , View.Components.dateViewer [ class "text-gray-900 text-sm uppercase" ]
                identity
                shared
                (Utils.fromDateTime history.insertedAt)
            ]
        , div [ class "flex flex-none pl-4" ]
            (viewAmount amount notification.symbol)
        ]


viewNotificationMint : Shared -> History -> MintData -> Html Msg
viewNotificationMint shared history notification =
    let
        maybeLogo =
            if String.isEmpty notification.community.logo then
                Nothing

            else
                Just notification.community.logo

        description =
            [ ( "amount", String.fromFloat notification.quantity )
            , ( "symbol", Eos.symbolToSymbolCodeString notification.community.symbol )
            ]
                |> shared.translators.tr "notifications.issue.receive"
    in
    div
        [ class "flex items-start lg:items-center p-4"
        , onClick (MarkAsRead history.id M)
        ]
        [ div [ class "flex-none" ]
            [ case maybeLogo of
                Just logoUrl ->
                    img
                        [ class "w-10 h-10 object-scale-down"
                        , src logoUrl
                        ]
                        []

                Nothing ->
                    div
                        [ class "w-10 h-10 object-scale-down" ]
                        []
            ]
        , div [ class "flex-col flex-grow-1 pl-4" ]
            [ p
                [ class "text-black" ]
                [ text description ]
            , View.Components.dateViewer [ class "text-gray-900 text-sm uppercase" ]
                identity
                shared
                (Utils.fromDateTime history.insertedAt)
            ]
        , div [ class "flex flex-none pl-4" ]
            (viewAmount notification.quantity notification.community.symbol)
        ]


viewNotificationSaleHistory : LoggedIn.Model -> History -> OrderData -> Html Msg
viewNotificationSaleHistory loggedIn notification sale =
    let
        logoString =
            sale.product.community.logo

        maybeLogo =
            if String.isEmpty logoString then
                Nothing

            else
                Just logoString
    in
    div
        [ class "flex items-start lg:items-center p-4"
        , onClick (MarkAsRead notification.id (S sale))
        ]
        (div
            [ class "flex-none" ]
            [ case maybeLogo of
                Just logoUrl ->
                    img
                        [ class "w-10 h-10 object-scale-down"
                        , src logoUrl
                        ]
                        []

                Nothing ->
                    div
                        [ class "w-10 h-10 object-scale-down" ]
                        []
            ]
            :: viewNotificationSaleHistoryDetail loggedIn sale notification.insertedAt
        )


viewNotificationSaleHistoryDetail : LoggedIn.Model -> OrderData -> DateTime -> List (Html msg)
viewNotificationSaleHistoryDetail ({ shared } as loggedIn) sale date =
    let
        isBuy =
            loggedIn.accountName == sale.fromId

        description =
            if isBuy then
                [ ( "user", Eos.nameToString sale.toId )
                , ( "sale", sale.product.title )
                ]
                    |> shared.translators.tr "notifications.saleHistory.buy"

            else
                [ ( "user", Eos.nameToString sale.fromId )
                , ( "sale", sale.product.title )
                ]
                    |> shared.translators.tr "notifications.saleHistory.sell"
    in
    [ div [ class "flex-col flex-grow-1 pl-4" ]
        [ p
            [ class "text-black" ]
            [ text description ]
        , View.Components.dateViewer [ class "text-gray-900 text-sm uppercase" ]
            identity
            shared
            (Utils.fromDateTime date)
        ]
    , case sale.product.images of
        [] ->
            text ""

        firstImage :: _ ->
            img
                [ src firstImage
                , class "object-scale-down rounded-full h-10 ml-4"
                ]
                []
    ]


viewAmount : Float -> Eos.Symbol -> List (Html msg)
viewAmount amount symbol =
    let
        amountText =
            FormatNumber.format usLocale amount

        color =
            if amount > 0 then
                "text-green"

            else
                "text-red"
    in
    [ div [ class "text-2xl", class color ] [ text amountText ]
    , div [ class "uppercase text-sm font-extralight mt-3 ml-2 font-sans", class color ]
        [ text <| Eos.symbolToSymbolCodeString symbol ]
    ]


viewEmptyNotifications : Shared -> Html msg
viewEmptyNotifications shared =
    div
        [ class "rounded-lg bg-white mt-5 p-8 text-center shadow" ]
        [ p [] [ text (shared.translators.t "notifications.empty") ]
        ]



-- UPDATE


type alias UpdateResult =
    UR.UpdateResult Model Msg (External Msg)


type Msg
    = CompletedLoadNotificationHistory (RemoteData (Graphql.Http.Error (List History)) (List History))
    | MarkAsRead Int Payload
    | CompletedReading (RemoteData (Graphql.Http.Error History) History)


update : Msg -> Model -> LoggedIn.Model -> UpdateResult
update msg model loggedIn =
    case msg of
        CompletedLoadNotificationHistory (RemoteData.Success notifications) ->
            Loaded notifications
                |> UR.init

        CompletedLoadNotificationHistory (RemoteData.Failure err) ->
            UR.init model
                |> UR.logGraphqlError msg
                    (Just loggedIn.accountName)
                    "Got an error when trying to load notification history"
                    { moduleName = "Page.Notification", function = "update" }
                    [ Log.contextFromCommunity loggedIn.selectedCommunity ]
                    err

        CompletedLoadNotificationHistory _ ->
            UR.init model

        MarkAsRead notificationId data ->
            let
                markAsRead =
                    LoggedIn.mutation loggedIn
                        (Notification.markAsReadMutation notificationId)
                        CompletedReading

                redirectCmd newCommunity =
                    case loggedIn.selectedCommunity of
                        RemoteData.Success community ->
                            if community.symbol == newCommunity.symbol then
                                Route.replaceUrl loggedIn.shared.navKey

                            else
                                Route.loadExternalCommunity loggedIn.shared newCommunity

                        _ ->
                            \_ -> Cmd.none
            in
            case data of
                T transfer ->
                    model
                        |> UR.init
                        |> UR.addExt markAsRead
                        |> UR.addCmd
                            (Route.ViewTransfer transfer.id
                                |> redirectCmd transfer.community
                            )

                M ->
                    model
                        |> UR.init
                        |> UR.addExt markAsRead

                S sale ->
                    model
                        |> UR.init
                        |> UR.addExt markAsRead
                        |> UR.addCmd
                            (Route.ViewSale sale.product.id
                                |> redirectCmd sale.product.community
                            )

        CompletedReading (RemoteData.Success hist) ->
            case model of
                Loaded histories ->
                    let
                        updatedHistories =
                            List.map
                                (\h ->
                                    if h.id == hist.id then
                                        { h | isRead = True }

                                    else
                                        h
                                )
                                histories
                    in
                    Loaded updatedHistories
                        |> UR.init

                _ ->
                    model
                        |> UR.init
                        |> UR.logImpossible msg
                            "Completed reading notification, but notifications weren't loaded"
                            (Just loggedIn.accountName)
                            { moduleName = "Page.Notification", function = "update" }
                            []

        CompletedReading (RemoteData.Failure e) ->
            model
                |> UR.init
                |> UR.logGraphqlError msg
                    (Just loggedIn.accountName)
                    "Got an error when reading notification"
                    { moduleName = "Page.Notification", function = "update" }
                    []
                    e

        CompletedReading _ ->
            UR.init model


msgToString : Msg -> List String
msgToString msg =
    case msg of
        CompletedLoadNotificationHistory r ->
            [ "CompletedLoadNotificationHistory", UR.remoteDataToString r ]

        MarkAsRead _ _ ->
            [ "MarkAsRead" ]

        CompletedReading r ->
            [ "CompletedReading", UR.remoteDataToString r ]
