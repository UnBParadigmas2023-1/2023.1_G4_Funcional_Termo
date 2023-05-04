import System.IO
import System.Directory (doesFileExist)

main :: IO()
main = do
    createGameScore

    saveGameScore 1 3

createGameScore :: IO()
createGameScore = do
    let fileName = "GameScore.txt"
    fileExists <- doesFileExist fileName

    if not fileExists
        then do
            appendFile fileName "0\n0\n0"
        else
            return() 
            

saveGameScore :: Int -> Int -> IO()
saveGameScore victory nAttempts = do
    let fileName = "GameScore.txt"
    let scoreSize = 3
    content <- readScoreList fileName
    let points = 6000 - (1000 * nAttempts)
    let newContent = zipWith(+) content [1,victory,points]
    printScore newContent scoreSize
    
printScore :: [Int] -> Int -> IO()
printScore _ 0 = printLine
printScore (x:xs) n
    | n == 1 = do
        putStr "Score: "
        print x
        printScore xs (n-1) 
    | n == 2 = do
        putStr "Vitorias: "
        print x
        printScore xs (n-1)
    | n == 3 = do
        printLine
        putStr "Numero de Jogos: "
        print x
        printScore xs (n-1)

printLine :: IO ()
printLine = do
    putStrLn "-----------------------------------------------"

readScoreList :: FilePath -> IO [Int]
readScoreList fileName = do
    score <- readFile fileName
    return (map read (words score))