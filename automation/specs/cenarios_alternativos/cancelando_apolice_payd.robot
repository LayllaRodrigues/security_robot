*** Settings ***
Resource        ${EXECDIR}/resources/Base.robot
Test Setup      Nova sessão manager
Test Teardown   Encerra sessão
Library         FakerLibrary    locale=pt_BR

*** Test Cases ***
Cancelando apolice por falta de pagamento

    DADO que preencho email e senha
    E cliquei em entrar
    E informei chassi que desejo encontrar

    

