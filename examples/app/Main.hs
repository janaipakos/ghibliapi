-- HTTP Simple tutorial found here: https://haskell-lang.org/library/http-client

module Main where

import Control.Monad
import Data.Aeson
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as B8
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as L8
import Data.Text as T
import GHC.Generics
import Network.HTTP.Simple

main :: IO ()
main = do
    putStrLn "Type the resource to GET: people, films, species, locations, vehicles"
    resource <- getLine
    if resource == "people"
        then writeJsonPeople resource >> readJsonPeople
        else if resource == "films"
            then writeJsonFilms resource >> readJsonFilms
        else putStrLn "invalid choice" >> main

writeJsonPeople :: String -> IO ()
writeJsonPeople resource = do
  response <- httpLBS (request resource)
  putStrLn $ "The status code was: " ++
             show (getResponseStatusCode response)
  print $ getResponseHeader "Content-Type" response
  let status = getResponseStatusCode response
  if status == 200
      then do
          print "saving request to file"
          let jsonBody = getResponseBody response
          L.writeFile "people.json" (L8.pack "{\"people\":")
          L.appendFile "people.json" jsonBody
          L.appendFile "people.json" (L8.pack "}")
      else print "request failed with error"

writeJsonFilms :: String -> IO ()
writeJsonFilms resource = do
  response <- httpLBS (request resource)
  putStrLn $ "The status code was: " ++
             show (getResponseStatusCode response)
  print $ getResponseHeader "Content-Type" response
  let status = getResponseStatusCode response
  if status == 200
      then do
          print "saving request to file"
          let jsonBody = getResponseBody response
          L.writeFile "films.json" (L8.pack "{\"films\":")
          L.appendFile "films.json" jsonBody
          L.appendFile "films.json" (L8.pack "}")
      else print "request failed with error"

readJsonPeople :: IO ()
readJsonPeople = do
    jsonData <- L.readFile "people.json"
    let ghibliResponse = decode jsonData :: Maybe GhibliPersonResponse
    let ghibliResults = people <$> ghibliResponse
    printPerson ghibliResults

readJsonFilms :: IO ()
readJsonFilms = do
    jsonData <- L.readFile "films.json"
    let ghibliResponse = decode jsonData :: Maybe GhibliFilmResponse
    let ghibliResults = films <$> ghibliResponse
    printFilm ghibliResults

ghibliHost :: B8.ByteString
ghibliHost = "ghibliapi.herokuapp.com"

apiPath :: String -> B8.ByteString
apiPath resource = mconcat ["/", B8.pack resource]

requestBuild :: B8.ByteString -> B8.ByteString -> B8.ByteString -> Request
requestBuild host method path = setRequestMethod method
                              $ setRequestHost host
                              $ setRequestPath path
                              $ setRequestSecure True
                              $ setRequestPort 443 defaultRequest

requestBuildNOSSL :: B8.ByteString -> B8.ByteString -> B8.ByteString -> Request
requestBuildNOSSL host method path = setRequestMethod method
                                   $ setRequestHost host
                                   $ setRequestSecure False
                                   $ setRequestPort 80
                                   $ setRequestPath path defaultRequest

request :: String -> Request
request resource = requestBuild ghibliHost "GET" (apiPath resource)

requestBad :: String -> Request
requestBad resource = requestBuildNOSSL (mconcat["http://",ghibliHost]) "GET" (apiPath resource)

data GhibliPersonResult = GhibliPersonResult
    { personId :: T.Text
    , name :: T.Text
    , gender :: T.Text
    , age :: T.Text
    , hairColor :: T.Text
    , eyeColor :: T.Text
    , filmsPeople :: [T.Text]
    , speciesPeople :: T.Text
    , urlPerson :: T.Text
    } deriving Show

data GhibliFilmResult = GhibliFilmResult
    { filmId :: T.Text
    , title :: T.Text
    , description :: T.Text
    , director :: T.Text
    , producer :: T.Text
    , releaseDate :: T.Text
    , rtScore :: T.Text
    , peopleFilm :: [T.Text]
    , speciesFilm :: [T.Text]
    , locations :: [T.Text]
    , vehicles :: [T.Text]
    , urlFilm :: T.Text
    } deriving Show

instance FromJSON GhibliPersonResult where 
    parseJSON (Object v) =
        GhibliPersonResult <$> v .: "id"
                           <*> v .: "name"
                           <*> v .: "gender"
                           <*> v .: "age"
                           <*> v .: "hair_color"
                           <*> v .: "eye_color"
                           <*> v .: "films"
                           <*> v .: "species"
                           <*> v .: "url"

instance FromJSON GhibliFilmResult where 
    parseJSON (Object v) =
        GhibliFilmResult <$> v .: "id"
                         <*> v .: "title"
                         <*> v .: "description"
                         <*> v .: "director"
                         <*> v .: "producer"
                         <*> v .: "release_date"
                         <*> v .: "rt_score"
                         <*> v .: "people"
                         <*> v .: "species"
                         <*> v .: "locations"
                         <*> v .: "vehicles"
                         <*> v .: "url"

data GhibliPersonResponse = GhibliPersonResponse
                    { people :: [GhibliPersonResult] 
                    } deriving (Show,Generic)

data GhibliFilmResponse = GhibliFilmResponse
                    { films :: [GhibliFilmResult] 
                    } deriving (Show,Generic)

instance FromJSON GhibliPersonResponse

instance FromJSON GhibliFilmResponse

printPerson :: Maybe [GhibliPersonResult] -> IO ()
printPerson Nothing = print "No data"
printPerson (Just people) = do
    print $ T.pack "Studio Ghibli People:"
    forM_ people $ \person -> do
        let resourceName = name person
        let resourceGender = gender person
        let resourceHairColor = hairColor person
        let resourceEyeColor = eyeColor person
        let resourceFilms = filmsPeople person
        print $ T.concat [T.pack "name: ", resourceName
                         ,T.pack ", gender: ", resourceGender
                         ,T.pack ", hair color: ", resourceHairColor
                         ,T.pack ", eye color: ", resourceEyeColor
                         ]

printFilm :: Maybe [GhibliFilmResult] -> IO ()
printFilm Nothing = print "No data"
printFilm (Just films) = do
    print $ T.pack "Studio Ghibli Films:"
    forM_ films $ \film -> do
        let resourceTitle = title film
        let resourceDescription = description film
        let resourceDirector = director film
        let resourceRTScore = rtScore film
        print $ T.concat [T.pack "title: ", resourceTitle
                         ,T.pack ", description: ", resourceDescription
                         ,T.pack ", director: ", resourceDirector
                         ,T.pack ", rt_score: ", resourceRTScore
                         ]