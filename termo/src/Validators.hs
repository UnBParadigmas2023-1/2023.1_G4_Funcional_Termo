module Validators
    ( isLengthCorrect,
      isSameString,
      isAnyWordInRightPlace,
      isAnyWordInWrongPlace,
      obtainIndexesOfSameLetter,
      obtainLettersInWrongPlace,
      validWord,
      sameLetterIndices,
      subtractOne,
      commonIndices
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
isAnyWordInWrongPlace answer word = any (\(c1, i1, c2, i2) -> c1 == c2 && i1 /= i2) combinations
  where combinations = [(word !! i1, i1, answer !! i2, i2) | i1 <- [0..length word - 1], i2 <- [0..length answer - 1]]

obtainIndexesOfSameLetter :: String -> String -> [Int]
obtainIndexesOfSameLetter word answer = 
  map fst $ filter (\(_, c) -> c == True) $ zip [0..] $ zipWith (==) word answer

-- obtainLettersInWrongPlace :: String -> String -> [Char]
-- obtainLettersInWrongPlace word answer = intersect (nub word) (nub answer)

obtainLettersInWrongPlace :: [Int] -> String -> String
obtainLettersInWrongPlace indices str = [str !! i | i <- indices]

commonIndices :: String -> String -> [Int]
commonIndices [] _ = []
commonIndices _ [] = []
commonIndices xs ys = commonIndices' xs ys 0
    where commonIndices' [] _ _ = []
          commonIndices' _ [] _ = []
          commonIndices' (x:xs) (y:ys) i
            | x /= y && xs /= ys = i : commonIndices' xs ys (i+1)
            | otherwise          = commonIndices' xs ys (i+1)

validWord :: String -> IO Bool
validWord word = do
  let url = "https://dicio-api-ten.vercel.app/v2/" ++ word
  request <- parseRequest url
  response <- httpLBS request
  let responseBody = getResponseBody response
  if responseBody == BLC.pack "{\"error\":\"Could not get word info\"}"
    then return False
    else return True

sameLetterIndices :: String -> String -> [Int]
sameLetterIndices s1 s2 =
  let indexedChars1 = zip [1..] s1
      indexedChars2 = zip [1..] s2
      sameChars = filter (\(i1, c1) -> any (\(i2, c2) -> c1 == c2 && i1 /= i2) indexedChars2) indexedChars1
  in map (\(i, _) -> i) sameChars

subtractOne :: [Int] -> [Int]
subtractOne xs = map (\x -> x - 1) xs