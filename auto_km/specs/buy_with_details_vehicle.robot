*** Settings ***
Resource    ${EXECDIR}/resources/Base.robot
Test Setup      Nova sessão
Test Teardown   Encerra sessão
Library         FakerLibrary    locale=pt_BR


*** Test Cases ***

Preenchendo cotação

    Validando que estou na tela inicial
    DADO Que Preenchi Os Dados Do Segurado E Motorista       ${TEST_NAME}    ${CPF}      ${email}    ${None}
    E informei dados do carro
    E selecionei o tipo de dono e uso do carro                  
    E informei os dados de pernoite                          ${CEP}        ${AddressNumber}
    E selecionei o plano
    E visualizei o frame solicitando a placa
    E fui até o campo placa
    E informei placa e versao do carro                       ${Plate}
    E realizei aceite LGPD
    E ok
    E selecionei o plano
    QUANDO eu preencher os dados do cartão de crédito        ${card}       ${date}      ${cvv}      ${TEST_NAME} 
    E confirmar o email                                      ${email}
    E encerrar a compra
    ENTÃO devo visualizar a tela de sucesso 



   