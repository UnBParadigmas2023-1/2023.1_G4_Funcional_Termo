module GameManager
    ( initGame
    ) where

import System.Exit (exitWith, ExitCode(..))

import Input(
    readString
    )

import GameScore(
  saveGameScore
  )

import Validators (
    isLengthCorrect,
    isSameString,
    isAnyWordInRightPlace,
    isAnyWordInWrongPlace,
    obtainIndexesOfSameLetter,
    obtainLettersInWrongPlace,
    validWord,
    sameLetterIndices,
    subtractOne
    )
import Control.Monad (Monad(return))

initGame :: String -> Int -> IO ()
initGame answer attempts =
    do
        if attempts == 6 
            then do
                putStrLn "\n\nVocê atingiu o limite de tentativas :("
                putStrLn $ "A palavra correta era: " ++ answer
                saveGameScore 0 attempts
                -- return()
            else do
                putStrLn $ "\nTentativa: [" ++ (show (attempts + 1)) ++ " de 6]"
                putStrLn "Digite seu palpite:"
                putStrLn "\n\n"

                word <- readString
                
                -- value <- validWord word

                if isLengthCorrect word
                    then do
                        putStr ""
                        if isSameString word answer
                            then do
                                putStrLn "Parabéns você acertou!"
                                saveGameScore 1 attempts
                            else do
                                if isAnyWordInRightPlace word answer
                                    then do
                                        displayAnswerSituation word (obtainIndexesOfSameLetter word answer)
                                    else do
                                        putStrLn ""
                                
                                if null (sameLetterIndices word answer)
                                    then do
                                        initGame answer (attempts + 1)
                                    else do
                                        displayAnswerSituationWhenWrongPlace word (subtractOne (sameLetterIndices word answer))
                                        initGame answer (attempts + 1)
                    else do
                        putStrLn "Palavra com tamanho Invalido, deve ter exatamente \ESC[91m5 \ESC[0mletras"
                        initGame answer (attempts + 0)

                
                



displayAnswerSituation :: String -> [Int] -> IO ()
displayAnswerSituation str indexes =
  do 
    let chars = zip [0..] str in
        mapM_ (printIndexedChar indexes) chars;
    putStrLn ""

printIndexedChar :: [Int] -> (Int, Char) -> IO ()
printIndexedChar indexes (i, c) =
  if i `elem` indexes
    then do
        putStr "\ESC[92m"
        putChar c

        putStr "\ESC[0m "
    else do
        putChar c
        putChar ' '

displayAnswerSituationWhenWrongPlace :: String -> [Int] -> IO ()
displayAnswerSituationWhenWrongPlace str indexes =
  do 
    let chars = zip [0..] str in
        mapM_ (printIndexedCharInWrongPlace indexes) chars;
    putStrLn ""

printIndexedCharInWrongPlace :: [Int] -> (Int, Char) -> IO ()
printIndexedCharInWrongPlace indexes (i, c) =
  if i `elem` indexes
    then do
        putStr "\ESC[33m"
        putChar c
        putStr "\ESC[0m "
    else do
        putChar c
        putChar ' '