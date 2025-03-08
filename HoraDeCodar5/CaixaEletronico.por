programa
{
    real saldo = 150.00
    cadeia extrato = "Depósito inicial: R$ 150.00\n"
    cadeia nomeUsuario = ""
    inteiro senhaCorreta = 3589

    funcao inicio()
    {
        nomeUser()
        opcaoCaixa()
    }

    funcao nomeUser()
    {
        escreva("Bem-vindo ao caixa eletrônico!\n")
        escreva("Digite seu nome: ")
        leia(nomeUsuario)
        escreva("Olá ", nomeUsuario, ", é um prazer ter você por aqui!\n\n")
    }

    funcao opcaoCaixa()
    {
        inteiro opcao

        escreva("Escolha uma opção:\n")
        escreva("1. Ver saldo\n")
        escreva("2. Ver extrato\n")
        escreva("3. Fazer saque\n")
        escreva("4. Fazer depósito\n")
        escreva("5. Fazer transferência\n")
        escreva("6. Sair\n\n")
        escreva("Opção: ")
        leia(opcao)

        escolha (opcao)
        {
            caso 1:
                verSaldo()
                pare
            caso 2:
                verExtrato()
                pare
            caso 3:
                fazerSaque()
                pare
            caso 4:
                fazerDeposito()
                pare
            caso 5:
                fazerTransferencia()
                pare
            caso 6:
                sair()
                pare
            caso contrario:
                erro()
        }
    }

    funcao verSaldo()
    {
        se (validarSenha())
        {
            escreva("Seu saldo atual é: R$ ", saldo, "\n\n")
            opcaoCaixa()
        }
    }

    funcao verExtrato()
    {
        se (validarSenha())
        {
            escreva("Seu extrato:\n")
            se (extrato == "")
            {
                escreva("Extrato vazio.\n")
            }
            senao
            {
                escreva(extrato)
            }
            escreva("\n")
            opcaoCaixa()
        }
    }

    funcao fazerSaque()
    {
        se (validarSenha())
        {
            real saque
            escreva("Qual o valor para saque? ")
            leia(saque)

            se (saque <= 0)
            {
                escreva("Operação não autorizada: Valor inválido.\n\n")
                fazerSaque()
            }
            senao se (saque > saldo)
            {
                escreva("Operação não autorizada: Saldo insuficiente.\n\n")
                fazerSaque()
            }
            senao
            {
                saldo = saldo - saque
                extrato = extrato + "Saque: R$ " + saque + "\n"
                escreva("Saque realizado com sucesso!\n")
                verSaldo()
            }
        }
    }

    funcao fazerDeposito()
    {
        real deposito
        escreva("Qual o valor para depósito? ")
        leia(deposito)

        se (deposito <= 0)
        {
            escreva("Operação não autorizada: Valor inválido.\n\n")
            fazerDeposito()
        }
        senao
        {
            saldo = saldo + deposito
            extrato = extrato + "Depósito: R$ " + deposito + "\n"
            escreva("Depósito realizado com sucesso!\n")
            verSaldo()
        }
    }

    funcao fazerTransferencia()
    {
        se (validarSenha())
        {
            inteiro contaDestino
            real valorTransferencia

            escreva("Informe o número da conta de destino: ")
            leia(contaDestino)

            escreva("Qual o valor para transferência? ")
            leia(valorTransferencia)

            se (valorTransferencia <= 0)
            {
                escreva("Operação não autorizada: Valor inválido.\n\n")
                fazerTransferencia()
            }
            senao se (valorTransferencia > saldo)
            {
                escreva("Operação não autorizada: Saldo insuficiente.\n\n")
                fazerTransferencia()
            }
            senao
            {
                saldo = saldo - valorTransferencia
                extrato = extrato + "Transferência para conta " + contaDestino + ": R$ " + valorTransferencia + "\n"
                escreva("Transferência realizada com sucesso!\n")
                verSaldo()
            }
        }
    }

    funcao erro()
    {
        escreva("Opção inválida! Tente novamente.\n\n")
        opcaoCaixa()
    }

    funcao sair()
    {
        escreva(nomeUsuario, ", foi um prazer ter você por aqui! Até logo!\n")
    }

    funcao logico validarSenha()
    {
        inteiro senha
        escreva("Digite a senha: ")
        leia(senha)

        se (senha == senhaCorreta)
        {
            retorne verdadeiro
        }
        senao
        {
            escreva("Senha incorreta! Tente novamente.\n\n")
            retorne falso
        }
    }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 8; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */