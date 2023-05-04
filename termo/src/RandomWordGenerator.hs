module RandomWordGenerator (selectWord) where

import System.Random

wordList :: [String]
wordList = ["termo", "suíte", "ávido", "festa", "bebia", "honra", "ouvir", "pesco", "fungo", "pagam", "ginga", "pinta", "poder", "útero", "pilha", "sarar", "fruta", "piano", "notar", "musgo", "tensa", "melão", "feliz", "miojo", "pagos", "texto", "mamãe", "ameno", "chuva", "coral", "forte", "tonta", "temor", "ligar", "rolar", "navio", "limbo", "calvo", "fedor", "balde", "oxalá", "talco", "lábia", "crime", "grade", "carta", "flora", "comum", "fatal", "pecar", "feroz", "vírus", "armar", "couro", "êxito", "ecoar", "balão", "falir", "tecer", "arena", "justo", "árido", "ruiva", "múmia", "fogão", "dupla", "touca", "sogro", "ósseo", "treta", "átomo", "sadio", "cólon", "pátio", "molas", "certo", "risco", "bossa", "porre", "tigre", "vocal", "treze", "sueco", "verbo", "latim", "povos", "longo", "lotar", "depor", "cento", "trava", "latão", "ditos", "tórax", "polir", "cacos", "túnel", "lindo", "pegar", "pilar", "passo", "piada", "puxar", "taças", "manta", "barba", "subir", "tosse", "adega", "veias", "mesma", "mirim", "mansa", "nobre", "grama", "ritmo", "samba", "ardor", "daqui", "bravo", "surfe", "tanto", "imune", "lucro", "finos", "bocas", "toldo", "major", "cabos", "estar", "focal", "ações", "queda", "juros", "elite", "burro", "fundo", "duelo", "breve", "bolso", "linha", "parir", "furar", "quina", "pasta", "suíno", "dosar"]

selectWord :: String
selectWord = do
  let size = length wordList
  randIndex <- getStdRandom (randomR (0, size))
  let selectedWord = wordList !! randIndex
  return selectedWord
