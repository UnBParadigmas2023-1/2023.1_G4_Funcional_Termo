module Main (main) where

import Lib()
import GameManager(
  initGame
  )

main :: IO ()
main = do
  putStrLn "A palavra de hoje tem 6 letras:"
  putStrLn "_ _ _ _ _ _"
  putStrLn ""

  
  initGame "teste" 1
