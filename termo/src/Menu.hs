module Menu (menu) where

import GameManager(
  initGame
  )

import RandomWordGenerator(
  selectRandomWord
  )

import GameScore(
  printScore
  )

import Input(
    readString
    )

menu :: IO ()
menu =
    do
        putStrLn "escolha a opção desejada:"
        putStrLn "1 - Jogar"
        putStrLn "2 - Estatisticas"
        putStrLn "3 - Tutorial"
        putStrLn "4 - Sair"
        opt <- readString
        hub opt


hub :: String -> IO ()
hub opt
    |opt == "1" = do
      word <- selectRandomWord
      initGame word 0
    |opt == "2" = printScore
    |opt == "3" = tuto
    |opt == "4" = exit
    |otherwise = menu


tuto :: IO ()
tuto =
  do
    putStrLn "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    putStrLn "Descubra a palavra certa em no maximo \ESC[31m6 \ESC[0mtentativas\n"
    putStrLn "Depois de cada tentativa, o jogo informa o quão certa está a palavra"
    putStrLn "\n\t\ESC[32mT\ESC[0mURMA\n"
    putStrLn "A letra \ESC[32mT \ESC[0mfaz parte da palavra e está no lugar correto"
    putStrLn "\n\t\ESC[0mVI\ESC[33mO\ESC[0mLA\n"
    putStrLn "A letra \ESC[33mO \ESC[0mfaz parte da palavras mas esta no lugar errado"
    putStrLn "\n\tPUL\ESC[90mG\ESC[0mA\n"
    putStrLn "A letra \ESC[90mG \ESC[0mnão faz parte da palavra"
    putStrLn "\nAs palavras podem ter letras repetidas\n"
    menu

exit =
  do
    putStrLn "\n\n\nSaindo..."