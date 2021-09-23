*** Settings ***
Resource    ${EXECDIR}/resources/Base.robot
Test Setup      Nova sessão
Test Teardown   Encerra sessão
Library         FakerLibrary        locale=pt_BR

*** Test Cases ***
Preenchendo cotação

    Set Selenium Timeout                        50s

    Dado Que Preenchi Os Dados Do Segurado E Motorista       ${TEST_NAME}    ${CPF}      ${email}    ${None}
    E informei vin e versao do carro                         ${vin} 
    E selecionei o tipo de dono e uso do carro                  
    E informei os dados de pernoite                          ${CEP}        ${AddressNumber}
    E selecionei o plano
    Quando eu preencher os dados do cartão de crédito        ${card}       ${date}      ${cvv}      ${TEST_NAME} 
    E confirmar o email                                      ${email}
    E encerrar a compra
    Então devo visualizar a tela de sucesso 