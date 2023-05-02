module Input
    ( readString
    ) where

import System.IO

readString :: IO String
readString = do x <- readChar
                if x == '\n' then do
                    -- By default, the last character is \n, then we just ignore it
                    return ""
                else do
                    xs <- readString
                    return (x:xs)

{-
    hSetEcho: When hSetEcho is enabled, characters typed by the user are printed 
    to the console as they are typed. When hSetEcho is disabled, the characters 
    typed by the user are not printed to the console.
        @param False: hidden the user input
        @param True: shows the user input
-}
readChar :: IO Char
readChar = do hSetEcho stdin True
              x <- getChar
              hSetEcho stdin False
              return x
