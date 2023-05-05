module GameScore (createGameScore, saveGameScore, printCasualScore, readScoreList) where

import System.Directory (doesFileExist)
import System.IO

createGameScore :: IO ()
createGameScore = do
  let fileName = "./src/files/GameScore.txt"
  fileExists <- doesFileExist fileName

  if not fileExists
    then do
      file <- openFile fileName WriteMode
      hPutStr file "0\n0\n0"
      hClose file
    else return ()

saveGameScore :: Int -> Int -> IO ()
saveGameScore victory nAttempts = do
  let fileName = "./src/files/GameScore.txt"
  let scoreSize = 3

  content <- readScoreList fileName

  let points = 6000 - (1000 * nAttempts)
  let newContent = zipWith (+) content [1, victory, points]
  let newContentStr = listIntToString newContent

  file <- openFile fileName WriteMode
  hPutStr file newContentStr
  hClose file

printCasualScore :: IO ()
printCasualScore = do
  let fileName = "./src/files/GameScore.txt"
  let scoreSize = 3

  content <- readScoreList fileName
  printScore content scoreSize

printScore :: [Int] -> Int -> IO ()
printScore _ 0 = printLine
printScore (x : xs) n
  | n == 1 = do
      putStr "Score: "
      print x
      printScore xs (n - 1)
  | n == 2 = do
      putStr "Vitorias: "
      print x
      printScore xs (n - 1)
  | n == 3 = do
      printLine
      putStr "Numero de Jogos: "
      print x
      printScore xs (n - 1)

readScoreList :: FilePath -> IO [Int]
readScoreList fileName = do
  file <- openFile fileName ReadMode
  scores <- hGetContents file
  last scores `seq` return scores
  let mappedScore = (map read (words scores))
  hClose file

  return mappedScore

listIntToString :: [Int] -> String
listIntToString [] = ""
listIntToString [x] = (show x)
listIntToString (x : xs) =
  (show x) ++ "\n" ++ listIntToString xs

printLine :: IO ()
printLine = do
  putStrLn "-----------------------------------------------"