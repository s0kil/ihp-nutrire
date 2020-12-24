module Web.Controller.Votes where

import Data.Text.Encoding (decodeUtf8)
import Network.Wai (requestHeaderReferer)
import Web.Controller.Prelude

instance Controller VotesController where
  action CreateVoteAction {userId, articleId} = do
    let vote =
          newRecord @Vote
            |> set #userId userId
            |> set #articleId articleId

    voteIsUnique <- isUniqueVote vote
    case voteIsUnique of
      True -> do
        vote |> createRecord
        setSuccessMessage "Successfully Voted"
      False -> do
        setErrorMessage "You Have Already Voted"

    maybeRedirectToReferer request
  action DeleteVoteAction {voteId} = do
    vote <- fetch voteId
    deleteRecord vote
    setSuccessMessage "Removed Vote Successfully"
    maybeRedirectToReferer request

isUniqueVote vote = do
  let userId = get #userId vote
      articleId = get #articleId vote

  maybeVote <-
    query @Vote
      |> filterWhere (#userId, userId)
      |> filterWhere (#articleId, articleId)
      |> fetchOneOrNothing

  let exists = case maybeVote of
        Just _ -> False
        Nothing -> True

  pure exists

maybeRedirectToReferer request =
  case (requestHeaderReferer request) of
    Just path ->
      -- https://gist.github.com/dino-/28b09c465c756c44b2c91d777408e166
      redirectToUrl $ decodeUtf8 path
    Nothing -> redirectToPath "/"
