module Web.Controller.Votes where

import Data.Text.Encoding (decodeUtf8)
import Network.Wai (requestHeaderReferer)
import Web.Controller.Prelude

instance Controller VotesController where
  action CreateVoteAction = do
    let vote = newRecord @Vote
    vote
      |> buildVote
      |> debug
      |> ifValid \case
        Left _ -> do
          setErrorMessage "Voting Failed"
          maybeRedirectToReferer request
        Right vote -> do
          vote |> createRecord
          setSuccessMessage "Successfully Voted"
          maybeRedirectToReferer request

buildVote vote =
  vote
    |> fill @["userId", "articleId"]
    |> validateField #userId nonEmpty
    |> validateField #articleId nonEmpty

maybeRedirectToReferer request =
  case (requestHeaderReferer request) of
    Just path ->
      -- https://gist.github.com/dino-/28b09c465c756c44b2c91d777408e166
      redirectToUrl $ decodeUtf8 path
    Nothing -> redirectToPath "/"
