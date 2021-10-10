*** Settings ***
Resource        ${EXECDIR}/resources/Base.robot
Test Setup      Nova sessão auto
Test Teardown   Encerra sessão
Library         FakerLibrary    locale=pt_BR

*** Test Cases ***
Preenchendo cotação
    
    Dado que selecionei cotar auto 
    E informei os dados do segurado  