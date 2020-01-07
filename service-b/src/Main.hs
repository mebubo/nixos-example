{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import Data.Time.Calendar (Day, fromGregorian)
import GHC.Generics (Generic)
import Servant
import Data.Aeson (ToJSON)
import Network.Wai.Handler.Warp (run)

type UserAPI = "users" :> Get '[JSON] [User]
  :<|> Get '[JSON] User

data User = User
    { name :: String
    , age :: Int
    , email :: String
    , registrationDate :: Day
    } deriving (Eq, Show, Generic)

instance ToJSON User

users :: [User]
users =
  [ User "Isaac Newton"    372 "isaac@newton.co.uk" (fromGregorian 1683  3 1)
  , User "Albert Einstein" 136 "ae@mc2.org"         (fromGregorian 1905 12 1)
  ]

server :: Server UserAPI
server = return users
  :<|> return (head users)

userAPI :: Proxy UserAPI
userAPI = Proxy

app :: Application
app = serve userAPI server

main :: IO ()
main = run 8081 app
