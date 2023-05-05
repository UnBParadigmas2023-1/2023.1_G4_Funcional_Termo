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

  putStrLn "    ███        ▄████████    ▄████████   ▄▄▄▄███▄▄▄▄    ▄██████▄  "
  putStrLn "▀█████████▄   ███    ███   ███    ███ ▄██▀▀▀███▀▀▀██▄ ███    ███ "
  putStrLn "   ▀███▀▀██   ███    █▀    ███    ███ ███   ███   ███ ███    ███ "
  putStrLn "    ███   ▀  ▄███▄▄▄      ▄███▄▄▄▄██▀ ███   ███   ███ ███    ███ "
  putStrLn "    ███     ▀▀███▀▀▀     ▀▀███▀▀▀▀▀   ███   ███   ███ ███    ███ "
  putStrLn "    ███       ███    █▄  ▀███████████ ███   ███   ███ ███    ███ "
  putStrLn "    ███       ███    ███   ███    ███ ███   ███   ███ ███    ███ "
  putStrLn "   ▄████▀     ██████████   ███    ███  ▀█   ███   █▀   ▀██████▀  "
  putStrLn "                           ███    ███                            "
  putStrLn ""
  putStrLn "pressione enter para continuar..."
  readString

  putStrLn "\ESC[2J"
  createGameScore
  menu
