import System.IO
import System.Directory (doesFileExist)

main :: IO()
main = do
    createGameScore

    saveGameScore True 3

createGameScore :: IO()
createGameScore = do
    let fileName = "GameScore.txt"
    fileExists <- doesFileExist fileName

    if not fileExists
        then
            appendFile fileName "0\n0\n0"
        else
            return() 
            

saveGameScore :: Bool -> Int -> IO()
saveGameScore victory nAttempts = do
    content <- readFile "GameScore.txt"
    putStr content[0]
