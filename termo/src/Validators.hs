module Validators
    ( isLengthCorrect,
      isSameString,
      isAnyWordInRightPlace,
      isAnyWordInWrongPlace,
      obtainIndexesOfSameLetter,
      obtainLettersInWrongPlace,
      validWord
    ) where

import Data.List (intersect, nub)
import Network.HTTP.Simple
import qualified Data.ByteString.Lazy.Char8 as BLC

isSameString :: String -> String -> Bool
isSameString str1 str2 
    | isLengthCorrect str1  == False   = False
    | otherwise                        = str1 == str2

isLengthCorrect :: String -> Bool
isLengthCorrect str = length str == 5

isAnyWordInRightPlace :: String -> String -> Bool
isAnyWordInRightPlace word answer = any (== True) (zipWith (==) word answer)

isAnyWordInWrongPlace :: String -> String -> Bool
isAnyWordInWrongPlace word answer = any (\(c1, i1, c2, i2) -> c1 == c2 && i1 /= i2) combinations
  where combinations = [(word !! i1, i1, answer !! i2, i2) | i1 <- [0..length word - 1], i2 <- [0..length answer - 1]]

obtainIndexesOfSameLetter :: String -> String -> [Int]
obtainIndexesOfSameLetter word answer = 
  map fst $ filter (\(_, c) -> c == True) $ zip [0..] $ zipWith (==) word answer

obtainLettersInWrongPlace :: String -> String -> [Char]
obtainLettersInWrongPlace word answer = intersect (nub word) (nub answer)

validWord :: String -> IO Bool
validWord word = do
  let url = "https://dicio-api-ten.vercel.app/v2/" ++ word
  request <- parseRequest url
  response <- httpLBS request
  let responseBody = getResponseBody response
  if responseBody == BLC.pack "{\"error\":\"Could not get word info\"}"
    then return False
    else return True
