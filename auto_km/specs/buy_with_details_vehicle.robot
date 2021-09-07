*** Settings ***
Resource    ${EXECDIR}/resources/Base.robot
Test Setup      Nova sessão
Test Teardown   Encerra sessão
Library         FakerLibrary    locale=pt_BR


*** Test Cases ***

Preenchendo cotação
    Set Selenium Timeout                        30s
    Preenchendo nome do segurado                ${insuredPerson}
    Preenchendo CPF do segurado                 ${CPF}
    Preenchendo E-mail do segurado              ${email}
    Preenchendo Telefone do segurado            ${phone}
    Scroll Element Into View                    id:insuredPersonMaritalStatus
    Selecionando status civil 
    Informando se o segurado é o motorista      
    Selecionando botton não tenho placa 
    Selecionando marca do veiculo
    Selecionando modelo do veiculo
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
    Autorizando envio de ofertas
    Clicando botton continuar 
    Selecionando plano 
    Preenchendo cartão de crédito                  ${card}
    Preenchendo data de validade do cartão         ${date}
    Preenchendo cvv                                ${cvv}
    Preenchendo nome do dono do cartão             ${insuredPerson}
    Confirmando email                              ${email}
    Realizando o pagamento e encerrando a compra 
    Tela de sucesso 