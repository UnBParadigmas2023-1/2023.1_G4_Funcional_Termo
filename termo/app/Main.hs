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

  putStrLn "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  createGameScore
  menu
