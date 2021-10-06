*** Settings ***
Resource        ${EXECDIR}/resources/Base.robot
Test Setup      Nova sessão
Test Teardown   Encerra sessão
Library         FakerLibrary    locale=pt_BR

*** Test Cases ***
Preenchendo cotação

    Validando que estou na tela inicial
    Dado Que Preenchi Os Dados Do Segurado E Motorista       ${TEST_NAME}    ${CPF}      ${email}    ${None}
    E informei vin e versao do carro                         ${vin_brand_new} 
    E selecionei o tipo de dono e uso do carro   
    E informei que meu carro é 0km               
    E informei os dados de pernoite                          ${CEP}        ${AddressNumber}
    E selecionei o plano
    Quando eu preencher os dados do cartão de crédito        ${card}       ${date}      ${cvv}      ${TEST_NAME} 
    E confirmar o email                                      ${email}
    E encerrar a compra
    Aguardando sucesso da keyword Então 
    Então devo visualizar a tela de sucesso
 