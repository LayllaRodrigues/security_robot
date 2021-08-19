*** Settings ***
Resource        base.robot

# Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***

Selecionando cotar
  
    Open Browser        https://cotacao.youse.com.br/seguro-auto-por-km/      chrome

    sleep                          10s
    Input Text                     class:jss5                                           John Hohn
    Input Text                     css:input[type='tel']                                ${cpf}
    Input Text                     css:input[type='email']                              laylla@teste.com.br
    Input Text                     css:input[type='phone']                              ${phone}          
    Click Element                  id:insuredPersonMaritalStatus        
    Click Element                  class:MuiList-padding    
    select checkbox                class:MuiIconButton-root                                                                        

    Sleep                          10s                             

*** Variables ***

${cpf} =                Convert To Number		      38249531884
${phone} =              Convert To Number             11933998877

    




