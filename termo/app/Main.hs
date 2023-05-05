module Main (main) where

import GameScore
  ( createGameScore,
  )
import Input
  ( readString,
  )
import Lib ()
import Menu
  ( menu,
  )

main :: IO ()
main = do
  putStrLn "\ESC[2J"
  putStrLn "BEM-VINDO AO"

  putStrLn "\ESC[92m████████╗\ESC[0m███████╗\ESC[91m██████╗ \ESC[92m███╗   ███╗ \ESC[0m██████╗ "
  putStrLn "\ESC[92m╚══██╔══╝\ESC[0m██╔════╝\ESC[91m██╔══██╗\ESC[92m████╗ ████║\ESC[0m██╔═══██╗"
  putStrLn "\ESC[92m   ██║   \ESC[0m█████╗  \ESC[91m██████╔╝\ESC[92m██╔████╔██║\ESC[0m██║   ██║"
  putStrLn "\ESC[92m   ██║   \ESC[0m██╔══╝  \ESC[91m██╔══██╗\ESC[92m██║╚██╔╝██║\ESC[0m██║   ██║"
  putStrLn "\ESC[92m   ██║   \ESC[0m███████╗\ESC[91m██║  ██║\ESC[92m██║ ╚═╝ ██║\ESC[0m╚██████╔╝"
  putStrLn "\ESC[92m   ╚═╝   \ESC[0m╚══════╝\ESC[91m╚═╝  ╚═╝\ESC[92m╚═╝     ╚═╝ \ESC[0m╚═════╝ "
                                             

  putStrLn "pressione enter para continuar..."
  readString

  putStrLn "\ESC[2J"
  createGameScore
  menu
