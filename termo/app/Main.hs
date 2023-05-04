module Main (main) where

import Lib()
import Input(
    readString
    )
import Menu(
    menu
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

  menu
