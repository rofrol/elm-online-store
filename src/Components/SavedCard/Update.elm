module Components.SavedCard.Update exposing (update)

-- OUR MODULES

import Components.SavedCard.Types exposing (..)
import Components.SavedCard.Api exposing (saveCard, getSavedCard)

-- UPDATE

update : Msg -> SavedCard -> (SavedCard, Cmd Msg)
update msg savedCard =
  case msg of
    SaveCard newCard ->
      savedCardLoading ! [ saveCard newCard ]

    GetSavedCard ->
      savedCardLoading ! [ getSavedCard ]

    UpdateSavedCardSuccess response ->
      { savedCard
        | number = response.number
        , name = response.name
        , exp = response.exp
        , cvv = response.cvv
        , isLoading = False
        , isLoaded = True
      } ! []

    UpdateSavedCardFail error ->
      savedCard ! []

    UseSavedCard ->
      { savedCard | shouldUse = True } ! []

savedCardLoading : SavedCard
savedCardLoading =
  SavedCard "" "" "" "" False True False False ""
