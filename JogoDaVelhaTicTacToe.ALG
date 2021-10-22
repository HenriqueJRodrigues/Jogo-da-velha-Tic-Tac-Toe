 Algoritmo "Desafio_Jogo_da_velha"
// Disciplina   : [PRATICANDO]
// Autor(a)    : HenriqueJRodrigues
Var
     ganhador,sair: logico
     jogo: vetor [1..11, 1..4] de caracter
     i,coluna,soma,onde,jogada,numerosJogadas: inteiro
     XO,vencedor,idJogadorUm,idJogadorDois: caracter
     modoJogo,termino,A1,rodada: inteiro
     pontuacaoJogador1,pontuacaoComputador2: inteiro
     pontuacaoPlayer1,pontuacaoPlayer2: inteiro
     pontuacaoComputador01,pontuacaoComputador02: inteiro
// --------------------------------------------------------
procedimento tabelaveia()
Inicio

   ganhador<- falso

jogo[11,1]<- "     \  /       "
jogo[11,2]<- "      \/        "
jogo[11,3]<- "      /\        "
jogo[11,4]<- "     /  \       "
jogo[10,1]<- "      __        "
jogo[10,2]<- "     /  \       "
jogo[10,3]<- "     |  |       "
jogo[10,4]<- "     \__/       "
jogo[9,1]<-  "                "
jogo[9,2]<-  "                "
jogo[9,3]<-  "        9       "
jogo[9,4]<-  "                "
jogo[8,1]<-  "                "
jogo[8,2]<-  "                "
jogo[8,3]<-  "        8       "
jogo[8,4]<-  "                "
jogo[7,1]<-  "                "
jogo[7,2]<-  "                "
jogo[7,3]<-  "        7       "
jogo[7,4]<-  "                "
jogo[6,1]<-  "                "
jogo[6,2]<-  "                "
jogo[6,3]<-  "        6       "
jogo[6,4]<-  "                "
jogo[5,1]<-  "                "
jogo[5,2]<-  "                "
jogo[5,3]<-  "        5       "
jogo[5,4]<-  "                "
jogo[4,1]<-  "                "
jogo[4,2]<-  "                "
jogo[4,3]<-  "        4       "
jogo[4,4]<-  "                "
jogo[3,1]<-  "                "
jogo[3,2]<-  "                "
jogo[3,3]<-  "        3       "
jogo[3,4]<-  "                "
jogo[2,1]<-  "                "
jogo[2,2]<-  "                "
jogo[2,3]<-  "        2       "
jogo[2,4]<-  "                "
jogo[1,1]<-  "                "
jogo[1,2]<-  "                "
jogo[1,3]<-  "        1       "
jogo[1,4]<-  "                "
   
   escreval("")
  para coluna de 1 ate 4 faca
   escreval("      ", jogo[1, coluna],"| ", jogo[2, coluna],"|", jogo[3, coluna]," ")
  fimpara
   escreval("      ----------------+-----------------+---------------- ")
  para coluna de 1 ate 4 faca
   escreval("      ", jogo[4, coluna],"| ", jogo[5, coluna],"|", jogo[6, coluna]," ")
  fimpara
   escreval("      ----------------+-----------------+---------------- ")
  para coluna de 1 ate 4 faca
   escreval("      ", jogo[7, coluna],"| ", jogo[8, coluna],"|", jogo[9, coluna]," ")
  fimpara
  escreval("")
  
fimprocedimento
//------------------------------------------------------
procedimento jogadarVez()
inicio

     escolha modoJogo
     caso 3
     XO<- "X"
     se (jogada mod 2 <> 0) entao
      escreval("                       ",idJogadorUm)
       escreva("               Digite um número de 1a9 para jogar: ")
       onde <- jogadasMaquina()
         timer(700)
         escreva(onde)
         timer(0)
      senao
      XO<- "O"
      escreval("                       ",idJogadorDois)
       escreva("               Digite um número de 1a9 para jogar: ")
        onde <- jogadasMaquina()
         timer(700)
         escreva(onde)
         timer(0)
       fimse
       
      caso 2
       se (jogada mod 2 <> 0) entao
       XO<- "X"
      escreval("                         ",idJogadorUm)
       escreva("               Digite um número de 1a9 para jogar: ")
         leia(onde)
      senao
      XO<- "O"
      escreval("                    ")
      escreval("                         ",idJogadorDois)
       escreva("               Digite um número de 1a9 para jogar: ")
         leia(onde)
        fimse
       
       caso 1
       se (jogada mod 2 <> 0) entao
       XO<- "X"
      escreval("                         ",idJogadorUm)
       escreva("               Digite um número de 1a9 para jogar: ")
         leia(onde)
      senao
      XO<- "O"
      escreval("                        ",idJogadorDois)
       escreva("               Digite um número de 1a9 para jogar: ")
         onde <- jogadasMaquina()
         timer(700)
          escreva(onde)
         timer(0)
       fimse
       
       fimescolha
      fimprocedimento
 //------------------------------------------------------------
procedimento jogadaTabela()
inicio

     repita
     jogadarVez()
     
     enquanto (onde < 0) ou (onde > 9) faça
     timer(200)
     escreva("                 Digite um número de 1a9 para jogar: ")
     leia(onde)
     timer(0)
     fimenquanto

     se (onde >= 0) e (onde <= 3) entao
      se(jogo[onde,1] = "     \  /       ") ou (jogo[onde,1] = "      __        ")entao
     timer(2000)
     escreva("              A posição já esta ocupada, escolha outra.")
     timer(0)
      senao
      limpatela
      mudatabela()
      verificaVencedor()
      numerosJogadas<- numerosJogadas +1
     fimse
     fimse

     se (onde >= 4) e (onde <= 6) entao
      se(jogo[onde,1] = "     \  /       ") ou (jogo[onde,1] = "      __        ")entao
       timer(2000)
       escreva("            A posição já esta ocupada, escolha outra.")
       timer(0)
       limpatela
       senao
       mudatabela()
       verificaVencedor()
       numerosJogadas<- numerosJogadas +1
     fimse
     fimse

     se (onde >= 7) e (onde <= 9) entao
      se(jogo[onde,1] = "     \  /       ") ou (jogo[onde,1] = "      __        ")entao
      timer(2000)
      escreva("             A posição já esta ocupada, escolha outra.")
      timer(0)
      limpatela
       senao
       mudatabela()
       verificaVencedor()
       numerosJogadas<- numerosJogadas +1
       fimse
       fimse


      tabelaAtualizada()
      ate (ganhador = verdadeiro) ou (numerosJogadas = 9)

 fimprocedimento
//----------------------------------------------------------------
procedimento mudatabela()
inicio

    para i de 1 ate 9 faça
    para coluna de 1 ate 4 faça
     se (onde = i) e (XO = "X") entao
     jogo[onde, coluna] <- jogo[11, coluna]
      senao
     se (onde = i) e (XO = "O") entao
      jogo[onde, coluna] <- jogo[10, coluna]
    fimse
    fimse
    fimpara
    fimpara

fimprocedimento

//----------------------------------------------------------------
procedimento verificaVencedor()
inicio

  escolha XO
    caso "X"
   se (jogo[1, 1] = "     \  /       ") e (jogo[2, 1] = "     \  /       ") e (jogo[3, 1] = "     \  /       ") entao
    // 1 - 2 - 3
     vencedor<- "X"
     ganhador<- verdadeiro
    senao
   se (jogo[4, 1] = "     \  /       ") e (jogo[5, 1] = "     \  /       ") e (jogo[6, 1] = "     \  /       ") entao
   // 4 - 5 - 6
    vencedor<- "X"
    ganhador<- verdadeiro
    senao
   se (jogo[7, 1] = "     \  /       ") e (jogo[8, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ") entao
   // 7 - 8 - 9
    vencedor<- "X"
    ganhador<- verdadeiro
    senao
   se (jogo[1, 1] = "     \  /       ") e (jogo[4, 1] = "     \  /       ") e (jogo[7, 1] = "     \  /       ") entao
   // 1 - 4 - 7
    vencedor<- "X"
    ganhador<- verdadeiro
    senao
   se (jogo[2, 1] = "     \  /       ") e (jogo[5, 1] = "     \  /       ") e (jogo[8, 1] = "     \  /       ") entao
   // 2 - 5 - 8
    vencedor<- "X"
    ganhador<- verdadeiro
    senao
   se (jogo[3, 1] = "     \  /       ") e (jogo[6, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ") entao
   // 3 - 6 - 9
    vencedor<- "X"
    ganhador<- verdadeiro
    senao
   se (jogo[1, 1] = "     \  /       ") e (jogo[5, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ") entao
   // 1 - 5 - 9
    vencedor<- "X"
    ganhador<- verdadeiro
    senao
   se (jogo[3, 1] = "     \  /       ") e (jogo[5, 1] = "     \  /       ") e (jogo[7, 1] = "     \  /       ") entao
   // 3 - 5 - 7
    vencedor<- "X"
    ganhador<- verdadeiro
   fimse
   fimse
   fimse
   fimse
   fimse
   fimse
   fimse
   fimse

    caso "O"
    // 1 - 2 - 3
    se (jogo[1, 1] = "      __        ") e (jogo[2, 1] = "      __        ") e (jogo[3,1] = "      __        ") entao
     vencedor<- "O"
     ganhador<- verdadeiro
     senao
     // 4 - 5 - 6
    se (jogo[4, 1] = "      __        ") e (jogo[5, 1] = "      __        ") e (jogo[6, 1] = "      __        ") entao
     vencedor<- "O"
     ganhador<- verdadeiro
     senao
     // 7 - 8 - 9
    se (jogo[7, 1] = "      __        ") e (jogo[8, 1] = "      __        ") e (jogo[9, 1] = "      __        ") entao
     vencedor<- "O"
     ganhador<- verdadeiro
     senao
    // 1 - 4 - 7
   se (jogo[1, 1] = "      __        ") e (jogo[4, 1] = "      __        ") e (jogo[7, 1] = "      __        ") entao
    vencedor<- "O"
    ganhador<- verdadeiro
   senao
   // 2 - 5 - 8
   se (jogo[2, 1] = "      __        ") e (jogo[5, 1] = "      __        ") e (jogo[8, 1] = "      __        ") entao
    vencedor<- "O"
    ganhador<- verdadeiro
    senao
   // 3 - 6 - 9
   se (jogo[3, 1] = "      __        ") e (jogo[6, 1] = "      __        ") e (jogo[9, 1] = "      __        ") entao
    vencedor<- "O"
    ganhador<- verdadeiro
    senao
   // 1 - 5 - 9
   se (jogo[1, 1] = "      __        ") e (jogo[5, 1] = "      __        ") e (jogo[9, 1] = "      __        ") entao
    vencedor<- "O"
    ganhador<- verdadeiro
    senao
   // 3 - 5 - 7
   se (jogo[3, 1] = "      __        ") e (jogo[5, 1] = "      __        ") e (jogo[7, 1] = "      __        ") entao
    vencedor<- "O"
    ganhador<- verdadeiro
   fimse
   fimse
   fimse
   fimse
   fimse
   fimse
   fimse
   fimse
   fimescolha
   
   jogada<- jogada + 1
   
fimprocedimento
//--------------------------------------------------------
procedimento tabelaAtualizada()
inicio

   limpatela
   banner()
   
  escreval("")
  para coluna de 1 ate 4 faca
   escreval("      ", jogo[1, coluna],"| ", jogo[2, coluna],"|", jogo[3, coluna]," ")
  fimpara
   escreval("      ----------------+-----------------+---------------- ")
  para coluna de 1 ate 4 faca
   escreval("      ", jogo[4, coluna],"| ", jogo[5, coluna],"|", jogo[6, coluna]," ")
  fimpara
   escreval("      ----------------+-----------------+---------------- ")
  para coluna de 1 ate 4 faca
   escreval("      ", jogo[7, coluna],"| ", jogo[8, coluna],"|", jogo[9, coluna]," ")
  fimpara
  escreval("")

fimprocedimento
//------------------------------------------------------
funcao jogadasMaquina():inteiro
var

   verificaJogada: logico
   novoNumero:inteiro

inicio



//===
  se (XO = "O") entao
   se (jogo[3, 1] = "      __        ") e (jogo[2, 1] = "      __        ") ou (jogo[5, 1] = "      __        ") e (jogo[9, 1] = "      __        ")ou (jogo[4, 1] = "      __        ") e (jogo[7, 1] = "      __        ") entao
    novoNumero <- 1
    senao
   se (jogo[1, 1] = "      __        ") e (jogo[2, 1] = "      __        ") ou (jogo[5, 1] = "      __        ") e (jogo[7, 1] = "      __        ")ou (jogo[6, 1] = "      __        ") e (jogo[9, 1] = "      __        ") entao
    novoNumero <- 3
    senao
   se (jogo[8, 1] = "      __        ") e (jogo[9, 1] = "      __        ") ou (jogo[1, 1] = "      __        ") e (jogo[4, 1] = "      __        ")ou (jogo[5, 1] = "      __        ") e (jogo[3, 1] = "      __        ") entao
    novoNumero <- 7
    senao
   se (jogo[1, 1] = "      __        ") e (jogo[5, 1] = "      __        ") ou (jogo[3, 1] = "      __        ") e (jogo[6, 1] = "      __        ")ou (jogo[7, 1] = "      __        ") e (jogo[8, 1] = "      __        ") entao
    novoNumero <- 9
    senao
   se (jogo[1, 1] = "      __        ") e (jogo[3, 1] = "      __        ") ou (jogo[5, 1] = "      __        ") e (jogo[8, 1] = "      __        ") entao
    novoNumero <- 2
    senao
   se (jogo[7, 1] = "      __        ") e (jogo[9, 1] = "      __        ") ou (jogo[2, 1] = "      __        ") e (jogo[5, 1] = "      __        ") entao
    novoNumero <- 8
    senao
   se (jogo[1, 1] = "      __        ") e (jogo[7, 1] = "      __        ") ou (jogo[5, 1] = "      __        ") e (jogo[6, 1] = "      __        ") entao
    novoNumero <- 4
    senao
   se (jogo[3, 1] = "      __        ") e (jogo[9, 1] = "      __        ") ou (jogo[4, 1] = "      __        ") e (jogo[5, 1] = "      __        ") entao
    novoNumero <- 6
    senao
   se (jogo[1, 1] = "      __        ") e (jogo[9, 1] = "      __        ")ou(jogo[7, 1] = "      __        ") e (jogo[3, 1] = "      __        ") ou (jogo[2, 1] = "      __        ") e (jogo[8, 1] = "      __        ")ou (jogo[4, 1] = "      __        ") e (jogo[6, 1] = "      __        ") entao
    novoNumero <- 5
    senao
   se (jogo[2, 1] = "     \  /       ") e (jogo[3, 1] = "     \  /       ")ou(jogo[5, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ") ou (jogo[4, 1] = "     \  /       ") e (jogo[7, 1] = "     \  /       ") entao
    novoNumero <- 1
    senao
   se (jogo[1, 1] = "     \  /       ") e (jogo[2, 1] = "     \  /       ")ou(jogo[5, 1] = "     \  /       ") e (jogo[7, 1] = "     \  /       ") ou (jogo[6, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ")entao
    novoNumero <- 3
    senao
   se (jogo[8, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ")ou(jogo[1, 1] = "     \  /       ") e (jogo[4, 1] = "     \  /       ") ou(jogo[5, 1] = "     \  /       ") e (jogo[3, 1] = "     \  /       ") entao
    novoNumero <- 7
    senao
   se (jogo[1, 1] = "     \  /       ") e (jogo[5, 1] = "     \  /       ")ou(jogo[3, 1] = "     \  /       ") e (jogo[6, 1] = "     \  /       ") ou (jogo[7, 1] = "     \  /       ") e (jogo[8, 1] ="     \  /       ") entao
    novoNumero <- 9
    senao
   se (jogo[1, 1] = "     \  /       ") e (jogo[3, 1] = "     \  /       ")ou(jogo[5, 1] ="     \  /       ") e (jogo[8, 1] = "     \  /       ") entao
    novoNumero <- 2
    senao
   se (jogo[7, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ")ou(jogo[2, 1] ="     \  /       ") e (jogo[5, 1] = "     \  /       ") entao
    novoNumero <- 8
    senao
   se (jogo[1, 1] = "     \  /       ") e (jogo[7, 1] = "     \  /       ")ou(jogo[5, 1] = "     \  /       ") e (jogo[6, 1] = "     \  /       ")entao
    novoNumero <- 4
    senao
   se (jogo[3, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ")ou(jogo[4, 1] = "     \  /       ") e (jogo[5, 1] = "     \  /       ")entao
    novoNumero <- 6
    senao
   se (jogo[1, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ")ou(jogo[7, 1] = "     \  /       ") e (jogo[3, 1] = "     \  /       ") ou (jogo[2, 1] = "     \  /       ") e (jogo[8, 1] = "     \  /       ")ou (jogo[4, 1] = "     \  /       ") e (jogo[6, 1] = "     \  /       ") entao
    novoNumero <- 5
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
//========
    se (XO = "X") entao
   se (jogo[2, 1] = "     \  /       ") e (jogo[3, 1] = "     \  /       ")ou(jogo[5, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ") ou (jogo[4, 1] = "     \  /       ") e (jogo[7, 1] = "     \  /       ") entao
    novoNumero <- 1
    senao
   se (jogo[1, 1] = "     \  /       ") e (jogo[2, 1] = "     \  /       ")ou(jogo[5, 1] = "     \  /       ") e (jogo[7, 1] = "     \  /       ") ou (jogo[6, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ")entao
    novoNumero <- 3
    senao
   se (jogo[8, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ")ou(jogo[1, 1] = "     \  /       ") e (jogo[4, 1] = "     \  /       ") ou (jogo[5, 1] = "     \  /       ") e (jogo[3, 1] = "     \  /       ") entao
    novoNumero <- 7
    senao
   se (jogo[1, 1] = "     \  /       ") e (jogo[5, 1] = "     \  /       ")ou(jogo[3, 1] = "     \  /       ") e (jogo[6, 1] = "     \  /       ") ou (jogo[7, 1] = "     \  /       ") e (jogo[8, 1] ="     \  /       ") entao
    novoNumero <- 9
    senao
   se (jogo[1, 1] = "     \  /       ") e (jogo[3, 1] = "     \  /       ")ou(jogo[5, 1] ="     \  /       ") e (jogo[8, 1] = "     \  /       ") entao
    novoNumero <- 2
    senao
   se (jogo[7, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ")ou(jogo[2, 1] ="     \  /       ") e (jogo[5, 1] = "     \  /       ") entao
    novoNumero <- 8
    senao
   se (jogo[1, 1] = "     \  /       ") e (jogo[7, 1] = "     \  /       ")ou(jogo[5, 1] = "     \  /       ") e (jogo[6, 1] = "     \  /       ")  entao
    novoNumero <- 4
    senao
   se (jogo[3, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ")ou(jogo[4, 1] = "     \  /       ") e (jogo[5, 1] = "     \  /       ")entao
    novoNumero <- 6
    senao
   se (jogo[1, 1] = "     \  /       ") e (jogo[9, 1] = "     \  /       ")ou(jogo[7, 1] = "     \  /       ") e (jogo[3, 1] = "     \  /       ") ou (jogo[2, 1] = "     \  /       ") e (jogo[8, 1] = "     \  /       ")ou (jogo[6, 1] = "     \  /       ") e (jogo[4, 1] = "     \  /       ") entao
    novoNumero <- 5
    senao
   se (jogo[3, 1] = "      __        ") e (jogo[2, 1] = "      __        ") ou (jogo[5, 1] = "      __        ") e (jogo[9, 1] = "      __        ")ou (jogo[4, 1] = "      __        ") e (jogo[7, 1] = "      __        ") entao
    novoNumero <- 1
    senao
   se (jogo[1, 1] = "      __        ") e (jogo[2, 1] = "      __        ") ou (jogo[5, 1] = "      __        ") e (jogo[7, 1] = "      __        ")ou (jogo[6, 1] = "      __        ") e (jogo[9, 1] = "      __        ") entao
    novoNumero <- 3
    senao
   se (jogo[8, 1] = "      __        ") e (jogo[9, 1] = "      __        ") ou (jogo[1, 1] = "      __        ") e (jogo[4, 1] = "      __        ")ou (jogo[5, 1] = "      __        ") e (jogo[3, 1] = "      __        ") entao
    novoNumero <- 7
    senao
   se (jogo[1, 1] = "      __        ") e (jogo[5, 1] = "      __        ") ou (jogo[3, 1] = "      __        ") e (jogo[6, 1] = "      __        ")ou (jogo[7, 1] = "      __        ") e (jogo[8, 1] = "      __        ") entao
    novoNumero <- 9
    senao
   se (jogo[1, 1] = "      __        ") e (jogo[3, 1] = "      __        ") ou (jogo[5, 1] = "      __        ") e (jogo[8, 1] = "      __        ") entao
    novoNumero <- 2
    senao
   se (jogo[7, 1] = "      __        ") e (jogo[9, 1] = "      __        ") ou (jogo[2, 1] = "      __        ") e (jogo[5, 1] = "      __        ") entao
    novoNumero <- 8
    senao
   se (jogo[1, 1] = "      __        ") e (jogo[7, 1] = "      __        ") ou (jogo[5, 1] = "      __        ") e (jogo[6, 1] = "      __        ") entao
    novoNumero <- 4
    senao
   se (jogo[3, 1] = "      __        ") e (jogo[9, 1] = "      __        ") ou (jogo[4, 1] = "      __        ") e (jogo[5, 1] = "      __        ") entao
    novoNumero <- 6
    senao
   se (jogo[1, 1] = "      __        ") e (jogo[9, 1] = "      __        ")ou(jogo[7, 1] = "      __        ") e (jogo[3, 1] = "      __        ") ou (jogo[2, 1] = "      __        ") e (jogo[8, 1] = "      __        ")ou (jogo[6, 1] = "      __        ") e (jogo[4, 1] = "      __        ") entao
    novoNumero <- 5
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
    fimse
//
   repita
   escolha novoNumero
   caso 1
    se (jogo[1,1] = "                ") entao
    verificaJogada<- verdadeiro
    fimse
   caso 2
    se (jogo[2,1] = "                ") entao
    verificaJogada<- verdadeiro
    fimse
   caso 3
    se (jogo[3,1] = "                ") entao
    verificaJogada<- verdadeiro
    fimse
   caso 4
    se (jogo[4,1] = "                ") entao
    verificaJogada<- verdadeiro
    fimse
   caso 5
    se (jogo[5,1] = "                ") entao
    verificaJogada<- verdadeiro
    fimse
   caso 6
    se (jogo[6,1] = "                ") entao
    verificaJogada<- verdadeiro
    fimse
   caso 7
    se (jogo[7,1] = "                ") entao
    verificaJogada<- verdadeiro
    fimse
   caso 8
    se (jogo[8,1] = "                ") entao
    verificaJogada<- verdadeiro
    fimse
   caso 9
    se (jogo[9,1] = "                ") entao
    verificaJogada<- verdadeiro
    fimse

   fimescolha

   se verificaJogada = falso entao
    novoNumero <- randi(9)+1
   fimse
   
   ate verificaJogada = verdadeiro

  retorne novoNumero

fimfuncao

//----------------------------------------------------------------
procedimento resultadoVencedor()
inicio

   timer(250)

   se (vencedor = "X") ou (vencedor = "O") entao
   escolha vencedor
  caso "X"
  escreva("          VENCEU  -->> ",idJogadorUm," <<--  VENCEU ")
   se A1 = 1 entao
    pontuacaoJogador1<- pontuacaoJogador1 + 1
    senao
   se A1 = 2 entao
    pontuacaoPlayer1<- pontuacaoPlayer1 + 1
    senao
   se A1 = 3 entao
    pontuacaoComputador01<- pontuacaoComputador01 +1
   fimse
   fimse
   fimse
  caso "O"
  escreva("          VENCEU  -->> ",idJogadorDois," <<--  VENCEU ")
   se A1 = 1 entao
    pontuacaoComputador2<- pontuacaoComputador2 + 1
    senao
   se A1 = 2 entao
    pontuacaoPlayer2<- pontuacaoPlayer2 + 1
    senao
   se A1 = 3 entao
    pontuacaoComputador02<- pontuacaoComputador02 + 1
   fimse
   fimse
   fimse
 fimescolha
  senao
   se (numerosJogadas = 9) entao
    escreva("                       __DEU VELHA__  ")
   fimse
  fimse

   timer (0)
   
fimprocedimento
//===============================================================
procedimento pontuacao()
inicio

    resultadoVencedor()
  timer(700)
    escreval("")
    escreval("")
    escreval("                         Pontuação:")
    escreval("")
    se A1 = 1 entao
     escreval("          ",idJogadorUm,": ",pontuacaoJogador1,"  |   ",idJogadorDois,": ",pontuacaoComputador2)
     senao
    se A1 = 2 entao
     escreval("          ",idJogadorUm,": ",pontuacaoPlayer1,"  |   ",idJogadorDois,": ",pontuacaoPlayer2)
     senao
    se A1 = 3 entao
     escreval("       ",idJogadorUm,": ",pontuacaoComputador01,"  |   ",idJogadorDois,": ",pontuacaoComputador02)
    fimse
    fimse
    fimse
  timer(0)

   fimprocedimento
//==============================================================
procedimento bannerMenu()
inicio

    escreval(" _ JOGO DA VELHA ________________________________________________ ")
    escreval("|                                                                |")
    escreval("|    _|_|_      1- Jogador Um(X) VS Computador Dois(O)           |")
    escreval("|    _|_|_       2- Jogador Um(X) VS Jogador Dois(O)             |")
    escreval("|     | |         3- Computador Um(X) VS Computador Dois(O)      |")
    escreval("|                                                                |")
    escreval("|_ Tic Tac Toe ___________________________________ By: HJR ______|")
    
fimprocedimento
//================================================================
procedimento banner():inteiro
inicio

   escolha A1
   caso 3
    escreval(" ________________________________________________________________ ")
    escreval("|                                                                |")
    escreval("|                                                                |")
    escreval("|          Computador Um(X)   VS   Computador Dois(O)            |")
    escreval("|                                                                |")
    escreval("|________________________________________________________________|")
   caso 2
    escreval(" ________________________________________________________________ ")
    escreval("|                                                                |")
    escreval("|                                                                |")
    escreval("|             Jogador Um(X)   VS   Jogador Dois(O)               |")
    escreval("|                                                                |")
    escreval("|________________________________________________________________|")
   caso 1
    escreval(" ________________________________________________________________ ")
    escreval("|                                                                |")
    escreval("|                                                                |")
    escreval("|             Jogador Um(X)   VS   Computador Um(O)              |")
    escreval("|                                                                |")
    escreval("|________________________________________________________________|")
   fimescolha

fimprocedimento
//---------------------------------------------------------------
procedimento jogarMenuSair():inteiro
   inicio

    escreval("")
    escreval(" ________________________________________________________________ ")
    escreval("|                                                                |")
    escreval("|                    1- Jogar novamente                          |")
    escreval("|                     2- Voltar ao MENU                          |")
    escreval("|                      3- Sair                                   |")
    escreval("|_____________________________________________________ HJR ______|")
    leia(termino)

    enquanto (termino < 1) OU (termino > 3) faça
    escreval("Favor escolher de 1a3")
    escreval("Digite novamente!")
    leia(termino)
    fimenquanto

    escolha termino
    caso 1
    numerosJogadas<- 0
    A1<- A1
    caso 2
    limpatela
    bannerMenu()
    jogar()
    caso 3
    sair<- verdadeiro
    Fimalgoritmo
    fimescolha

fimprocedimento
//----------------------------------------------------------------
 procedimento jogar()
  inicio


    leia(A1)

    se (A1 < 1) OU (A1 > 3) entao
    repita
    escreval("Favor escolher de 1a3")
    escreval("Digite novamente!")
    leia(A1)
    ate (A1 >= 1) e (A1 <= 3)
    fimse

    repita
    vencedor<- "_"
    ganhador<- falso
    numerosJogadas<- 0
    sair<- falso

    jogada <- randi(2)+1

    limpatela


    escolha A1
    caso 1
     banner()
     idJogadorUm<- "Jogador Um(X)"
     idJogadorDois<- "Computador Um(O)"
     modoJogo<- 1

    caso 2
     banner()
     idJogadorUm<- "Jogador Um(X)"
     idJogadorDois<- "Jogador dois(O) "
     modoJogo<- 2

    caso 3
     banner()
     idJogadorUm<- "Computador Um(X)"
     idJogadorDois<- "Computador Dois (O)"
     modoJogo<- 3

    fimescolha

     tabelaveia()
     jogadaTabela()
     pontuacao()
     jogarMenuSair()
          
   ate sair = verdadeiro

fimprocedimento

inicio

bannerMenu()
jogar()

Fimalgoritmo