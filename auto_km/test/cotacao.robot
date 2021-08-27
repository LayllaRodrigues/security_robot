*** Settings ***
Resource        base.robot

# Test Setup      Nova sessão
Test Teardown   Encerra sessão

*** Test Cases ***

Preenchendo cotação
  
    Open Browser        https://stage-cotacao.youse.io/seguro-auto-por-km      chrome
    Wait Until Element Is Visible   css:input[id="insuredPersonName"] 

    Input Text                     css:input[id="insuredPersonName"]                                          John Hohn
    Click Element                  css:input[type='tel']
    Input Text                     css:input[type='tel']                                ${cpf}
    Input Text                     css:input[type='email']                              laylla@teste.com.br
    Input Text                     css:input[type='phone']                              ${phone}          
    Click Element                  id:insuredPersonMaritalStatus                        
    Click Element                  class:MuiList-padding   
    sleep                           4          
    Click Element                  xpath://*[@id="root"]/div[2]/div/div[8]/div/div[2]/div/label[1]/span[1]/span[1]                              
    sleep                          4s             
    Click Element                  css:input[id=vehicleLicensePlate]          
    Input Text                     css:input[id=vehicleLicensePlate]                    ${Plate}
    Click Element                  css:div[errorfor="vehicleLicensePlate"]                             
    Element Should Be Visible      class:hZdnym
    Wait Until Element Is Visible  css:div[id="vehicleUsage"]
    Click Element                  css:div[id="vehicleUsage"]
    Click Element                  css:li[data-value="only_private"]
    Wait Until Element Is Visible  css:div[id="vehicleOwnershipStatus"]
    Click Element                  css:div[id="vehicleOwnershipStatus"]
    Wait Until Element Is Visible  css:li[data-value="owned_by_person"]

    Click Element                  css:li[data-value="owned_by_person"]
    sleep                          4s
    Wait Until Element Is Visible  xpath://*[@id="root"]/div[2]/div/div[13]/div[2]/div/div[2]
    Click Element                  xpath://*[@id="root"]/div[2]/div/div[13]/div[2]/div/div[2]
    Input Text                     xpath://*[@id="root"]/div[2]/div/div[13]/div[2]/div/div[2]/div/input         ${CEP}
    Click Element                  css:input[id="insuredPersonAddressNeighborhood"]
    Input Text                     css:input[id="insuredPersonAddressNumber"]                                       ${AddressNumber}
    # sleep                          4 
    Click Element                  xpath://*[@id="root"]/div[2]/div/div[15]/div/div[2]/div/label[1]/span[1]/span[1]
    sleep                           4s
    Click Element                  css:button[class="sc-dIvrsQ fUTxYh"]
    sleep                           10s
    Click Element                   css:div[class="sc-jSFjdj jRglJP"]
    sleep                           7s


    Select Frame                               css:iframe[class="js-iframe"][title="Iframe para número de cartão seguro"]
    Wait Until Element Is Visible              css:input[class="js-iframe-input input-field"][id="encryptedCardNumber"]
    Input Text                                 css:input[class="js-iframe-input input-field"][id="encryptedCardNumber"]    ${card}

    sleep                                       7s

    # Select Frame                               css:input[class="js-iframe-input input-field"][id="encryptedExpiryDate"]
    Wait Until Element Is Visible              css:input[class="js-iframe-input input-field"][id="encryptedExpiryDate"]
    Input Text                                 css:input[class="js-iframe-input input-field"][id="encryptedExpiryDate"]   9909



    
  
                           


*** Variables ***

${cpf} =                        Convert To Number		                  12345675209
${phone} =                      Convert To Number                         11933998877
${Plate} =                                                                YOU0000
${CEP} =                        Convert To Number                         04538133
${AddressNumber} =                                                        90
${card}                                                                   4111 1111 1111 1111
${date}                                                                   0330
${cardname}                                                               John Hohn




