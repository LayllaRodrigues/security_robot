*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***

Preenchendo cotação
    Set Selenium Timeout                        30s
    Preenchendo nome do segurado                ${cardname}
    Preenchendo CPF do segurado                 ${CPF}
    Preenchendo E-mail do segurado              ${email}
    Preenchendo Telefone do segurado            ${phone}
    Sleep   4s
    Scroll Element Into View                    id:insuredPersonMaritalStatus
    Selecionando status civil 
    Informando se o segurado é o motorista      

    Selecionando botton não tenho placa 
    Selecionando marca do veiculo
    Selecionando modelo do veiculo
    Sleep   4
    Selecionando ano do veiculo
    Selecionando versao do veiculo

    Selecionando tipo de uso do carro           
    Selecionando tipo de dono do carro
    Informando CEP                                ${CEP}
    Informando numero do endereço de pernoite     ${AddressNumber}
    Clicando botton continuar 
    Selecionando plano 


    Selecionando botton informar chassi e placa     

    Informando placa        ${Plate}

    Sleep  4

    Autorizando envio de ofertas

    sleep   4

    Clicando botton continuar 
    Selecionando plano 
    Preenchendo cartão de crédito                  ${card}
    Preenchendo data de validade do cartão         ${date}
    Preenchendo cvv                                ${cvv}
    Preenchendo nome do dono do cartão             ${cardname}
    Confirmando email                              ${email}
    Realizando o pagamento e encerrando a compra 
    Tela de sucesso 