module GameManager
    ( initGame
    ) where

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


initGame :: String -> Int -> IO ()
initGame answer attempts =
    do
        putStrLn $ "\nTentativa: [" ++ (show (attempts + 1)) ++ "]"
        putStrLn "Digite seu palpite:"
        putStrLn "\n"
        putStrLn "_ _ _ _ _"
        putStrLn "\n"

        word <- readString
        
        -- value <- validWord word

        -- if value == False
        --     then do 
        --         -- putStrLn "A palavra digita não existe! Tente novamente."
        --         -- putStrLn "O número de tentativas não é alterado"
        --         initGame answer (attempts + 0)
        --     else do
        --         putStrLn "A palavra digitada existe!"
        
        if (isLengthCorrect word) == False
            then do
                putStrLn "A palavra digitada não possui o mesmo tamanho da palavra a ser adivinhada! Tente novamente."
                putStrLn "O número de tentativas não é alterado"
                initGame answer (attempts + 0)
            else
                putStrLn ""

        if isSameString word answer
            then do
                putStrLn "Acertou mizeravi!"
            else do
                if isAnyWordInRightPlace word answer
                    then do
                        putStrLn "Há letras em comum nas mesmas posições!"
                        putStrLn $ "As letras iguais estão nas posições: " ++ show (obtainIndexesOfSameLetter word answer)
                        displayAnswerSituation word (obtainIndexesOfSameLetter word answer)
                    else do
                        putStrLn "Não há letras em comum na mesma posição"
                
                if null (sameLetterIndices word answer)
                    then do
                        putStrLn "Não há letras em comum"
                        initGame answer (attempts + 1)
                    else do
                        putStrLn "As letras em comum estão em posições diferentes!"
                        
                        putStrLn $ "sameLetterIndices " ++ show (sameLetterIndices word answer)
                        displayAnswerSituationWhenWrongPlace word (subtractOne (sameLetterIndices word answer))
                        initGame answer (attempts + 1)

        saveGameScore 1 attempts


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