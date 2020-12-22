module Web.View.Articles.Show where

import Web.View.Prelude
import Web.View.Votes.Shared (votingButton)

data ShowView = ShowView
  { author :: User,
    article :: Article
  }

instance View ShowView where
  html ShowView {..} =
    let text = get #text article
        title = get #title article
        authorName = get #fullname author
        createdAt = get #createdAt article
        image = fromMaybe "" (get #image article)
     in [hsx|
          <div class="container max-w-2xl m-auto" style="width: 600px;">
            <div>
              <img class="m-auto" src={image} alt={title} style="height: 600px; width: auto" />
            </div>
            <div class="my-6">
              <h1 class="text-5xl text">
                {title}
              </h1>
            </div>
            <div class="my-6">
              <span class="mr-1">{authorName}</span>
              <span class="mr-1">|</span>
              <span class="mr-1">{timeAgo createdAt}</span>
            </div>
            <div class="my-6">
              {votingButton article currentUser}
            </div>
            <div class="my-6">
              {text}
            </div>
          </div>
        |]
    where
      currentUser = fromFrozenContext @(Maybe User)
