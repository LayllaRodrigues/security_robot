*** Settings ***
Resource        base.robot

# Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***

Preenchendo cotação
  
    Open Browser        https://stage-cotacao.youse.io/seguro-auto-por-km      chrome

    sleep                          10s
    Input Text                     class:jss5                                           John Hohn
    Click Element                  css:input[type='tel']
    Input Text                     css:input[type='tel']                                ${cpf}
    Input Text                     css:input[type='email']                              laylla@teste.com.br
    Input Text                     css:input[type='phone']                              ${phone}          
    Click Element                  id:insuredPersonMaritalStatus                        
    Click Element                  class:MuiList-padding                                
    Click Element                  css:input[value="false"]                              
    Click Element                  css:input[value="true"]                             
    Input Text                     css:input[id=vehicleLicensePlate]                    ${Plate}
    Click Element                  css:div[errorfor="vehicleLicensePlate"]                             
    Element Should Be Visible      class:hZdnym
    Wait Until Element Is Visible  css:div[id="vehicleUsage"]
    Click Element                  css:div[id="vehicleUsage"]
    Click Element                  css:li[data-value="only_private"]
    Wait Until Element Is Visible  css:div[id="vehicleOwnershipStatus"]
    Click Element                  css:div[id="vehicleOwnershipStatus"]
    Click Element                  css:li[data-value="owned_by_person"]
    Wait Until Element Is Visible  xpath://*[@id="root"]/div[2]/div/div[13]/div[2]/div/div[2]/div/input
    Click Element                  xpath://*[@id="root"]/div[2]/div/div[13]/div[2]/div/div[2]/div/input
    Input Text                     xpath://*[@id="root"]/div[2]/div/div[13]/div[2]/div/div[2]/div/input             ${CEP}
    Click Element                  css:input[id="insuredPersonAddressNeighborhood"]
    Input Text                     css:input[id="insuredPersonAddressNumber"]                                       ${AddressNumber}
    Click Element                  xpath://*[@id="root"]/div[2]/div/div[15]/div/div[2]/div/label[1]/span[1]
    
    sleep                           10s




                           


*** Variables ***

${cpf} =                        Convert To Number		                  12345675209
${phone} =                      Convert To Number                         11933998877
${Plate} =                                                                YOU0000
${CEP} =                        Convert To Number                         04538133
${AddressNumber} =                                                        90
    




