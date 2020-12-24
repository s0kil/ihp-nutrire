module Web.View.Votes.Shared (articleVote, articleVotingButton, downVoteButton, upVoteButton) where

import Web.View.Components.Button (button)
import Web.View.Prelude

articleVote :: [Vote] -> Id Article -> Maybe Vote
articleVote votes articleId = find (\vote -> articleId == (get #articleId vote)) votes

articleVotingButton :: Article -> [Vote] -> Maybe User -> Html
articleVotingButton article votes user =
  let articleId = (get #id article)
   in case articleVote votes articleId of
        Just vote -> downVoteButton (get #id vote)
        Nothing -> upVoteButton article user

downVoteButton :: (Id Vote) -> Html
downVoteButton voteId =
  [hsx|
    <a href={DeleteVoteAction voteId} class="js-delete js-delete-no-confirm">
      <button class={button}>Down Vote</button>
    </a>
  |]

upVoteButton :: Article -> Maybe User -> Html
upVoteButton _ Nothing = ""
upVoteButton article (Just user) =
  [hsx|
    <form action={CreateVoteAction} method="POST">
        <input type="hidden" name="articleId" value={articleId} />
        <input type="hidden" name="userId" value={userId} />
        <button class={button} type="submit">Up Vote</button>
    </form>
  |]
  where
    articleId = show $ get #id article
    userId = show $ get #id user
