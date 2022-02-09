*** Settings ***
Resource        ${EXECDIR}/resources/Base.robot
Test Setup      Nova sessão auto
Test Teardown   Encerra sessão
Library         FakerLibrary    locale=pt_BR

*** Test Cases ***
Preenchendo cotação
    
    Dado que selecionei cotar auto 
    E passei os dados do segurado
    E informei a placa e dados do veiculo 
    E escolhi o plano basico
    Quando os dados de pagamento forem preenchidos corretamente
    Aguardando sucesso da keyword Então CONVENCIONAL
    ENTÃO devo visualizar a tela de sucesso AUTO CONVENCIONAL

