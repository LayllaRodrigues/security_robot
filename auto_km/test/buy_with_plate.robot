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
    Selecionando status civil 
    Informando se o segurado é o motorista   
    Informando placa                             ${Plate}
    Scroll Element Into View                      css:div[id="vehicleOwnershipStatus"]
    sleep       4s
    Selecionando tipo de uso do carro           
    sleep       4s
    Selecionando tipo de dono do carro
    sleep       4s
    Informando CEP          ${CEP}
    Informando numero do endereço de pernoite        ${AddressNumber}
    Clicando botton continuar 
    Selecionando plano 

    Preenchendo cartão de crédito                   ${card}
    Preenchendo data de validade do cartão          ${date}
    Preenchendo cvv                                 ${cvv}
    Preenchendo nome do dono do cartão              ${cardname}
    
    Confirmando email                               ${email}

    Realizando o pagamento e encerrando a compra 
    Tela de sucesso 