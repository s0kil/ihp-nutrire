module Web.View.Votes.Shared (articleVote, articleVotingButton, downVoteButton, upVoteButton) where

import Web.View.Components.Button (button)
import Web.View.Prelude

articleVote :: [Vote] -> Article -> Maybe Vote
articleVote votes article =
  find (\vote -> (get #id article) == (get #articleId vote)) votes

articleVotingButton :: Article -> [Vote] -> (Maybe User) -> Html
articleVotingButton _ _ Nothing = ""
articleVotingButton article votes (Just user) =
  case articleVote votes article of
    Just vote -> downVoteButton vote
    Nothing -> upVoteButton article user

downVoteButton :: Vote -> Html
downVoteButton vote =
  [hsx|
    <a href={DeleteVoteAction (get #id vote)} class="js-delete js-delete-no-confirm">
      <button class={button}>Down Vote</button>
    </a>
  |]

upVoteButton :: Article -> User -> Html
upVoteButton article user =
  [hsx|
    <form action={CreateVoteAction (get #id user) (get #id article)} method="POST">
      <button class={button} type="submit">Up Vote</button>
    </form>
  |]
