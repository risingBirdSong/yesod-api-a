{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
module Handler.Posts where
import Import


getPostsR :: Handler Value
getPostsR = do
    posts <- runDB $ selectList [] [] :: Handler [Entity Post]

    return $ object ["posts" .= posts]

postPostsR :: Handler ()
postPostsR = do
    putStrLn "testing"
    post <- requireCheckJsonBody :: Handler Post
    _    <- runDB $ insert post

    sendResponseStatus status201 ("CREATED" :: Text)

deletePostsR :: PostId -> Handler Value
deletePostsR pid = do
    runDB $ delete pid

    sendResponseStatus status200 ("DELETED" :: Text)