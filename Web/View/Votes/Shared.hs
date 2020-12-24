module Web.View.Votes.Shared (votingButton) where

import Web.View.Components.Button (button)
import Web.View.Prelude

votingButton :: Article -> Maybe User -> Html
votingButton _ Nothing = [hsx||]
votingButton article (Just user) =
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
