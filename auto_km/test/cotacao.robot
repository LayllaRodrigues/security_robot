*** Settings ***
Resource        base.robot

Test Setup      Nova sessão
Test Teardown   Encerra sessão


*** Test Cases ***

Preenchendo cotação
    Set Selenium Timeout                        30s
  
    Wait Until Element Is Visible               css:input[id="insuredPersonName"] 
    Input Text                                  css:input[id="insuredPersonName"]                                                 ${cardname}
    Click Element                               css:input[type='tel']
    Input Text                                  css:input[type='tel']                                                             ${cpf}
    Input Text                                  css:input[type='email']                                                           ${email}
    Input Text                                  css:input[type='phone']                                                           ${phone}          
    Click Element                               id:insuredPersonMaritalStatus                        
    Click Element                               class:MuiList-padding 
    Wait Until Element Is Visible               xpath://*[@id="root"]/div[2]/div/div[8]/div/div[2]/div/label[1]/span[1]/span[1]
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[8]/div/div[2]/div/label[1]/span[1]/span[1]    
    Wait Until Element Is Visible               css:input[id=vehicleLicensePlate]                        
    Click Element                               css:input[id=vehicleLicensePlate]          
    Input Text                                  css:input[id=vehicleLicensePlate]                                                ${Plate}
    Click Element                               css:div[errorfor="vehicleLicensePlate"]                             
    Element Should Be Visible                   class:hZdnym

    sleep       4s

    Wait Until Element Is Visible               css:div[id="vehicleUsage"]
    Click Element                               css:div[id="vehicleUsage"]  
    Click Element                               css:li[tabindex="0"][data-value="only_private"]

    sleep       4s
    
    Wait Until Element Is Visible               css:div[id="vehicleOwnershipStatus"]
    Click Element                               css:div[id="vehicleOwnershipStatus"]
    Wait Until Element Is Visible               css:li[data-value="owned_by_person"]
    Click Element                               css:li[data-value="owned_by_person"]

    sleep       4s
    # Wait Until Element Is Visible               css:div[spacing="[object Object]"][class="sc-jSFjdj byghvu"]
    Click Element                               css:div[spacing="[object Object]"][class="sc-jSFjdj byghvu"]
    Input Text                                  xpath://*[@id="root"]/div[2]/div/div[13]/div[2]/div/div[2]/div/input                ${CEP}

    Click Element                               css:input[id="insuredPersonAddressNeighborhood"]
    Input Text                                  css:input[id="insuredPersonAddressNumber"]                                          ${AddressNumber}
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[15]/div/div[2]/div/label[1]/span[1]/span[1]

    Wait Until Element Is Visible               css:button[class="sc-dIvrsQ fUTxYh"]
    Click Element                               css:button[class="sc-dIvrsQ fUTxYh"]

    Wait Until Element Is Visible               css:div[class="sc-jSFjdj jRglJP"]
    Click Element                               css:div[class="sc-jSFjdj jRglJP"]
    
    Wait Until Element Is Visible               css:iframe[class="js-iframe"][title="Iframe para número de cartão seguro"]
    Select Frame                               css:iframe[class="js-iframe"][title="Iframe para número de cartão seguro"]
    Wait Until Element Is Visible              css:input[class="js-iframe-input input-field"][id="encryptedCardNumber"]
    Input Text                                 css:input[class="js-iframe-input input-field"][id="encryptedCardNumber"]                     ${card}
    Unselect Frame                             

    Select Frame                                css:iframe[class="js-iframe"][title="Iframe para data de validade do cartão seguro"]
    Wait Until Element Is Visible               css:input[class="js-iframe-input input-field"][id="encryptedExpiryDate"]
    Input Text                                  css:input[class="js-iframe-input input-field"][id="encryptedExpiryDate"]                     ${date}
    Unselect Frame                             


    Select Frame                                css:iframe[class="js-iframe"][title="Iframe para código de segurança do cartão seguro"]
    Wait Until Element Is Visible               css:input[class="js-iframe-input input-field"][id="encryptedSecurityCode"]
    Input Text                                  css:input[class="js-iframe-input input-field"][id="encryptedSecurityCode"]                    ${cvv}
    Unselect Frame                             


    Input Text                                  css:input[placeholder="Nome como no cartão"]                                             ${cardname}
    Input Text                                  css:input[id="insuredPersonEmailConfirm"]                                                ${email}

    Click Element                               css:button[class="sc-dIvrsQ fUTxYh"]

    Wait Until Page Contains                    Recebemos suas informações!
    Page Should Contain                         Recebemos suas informações!



*** Variables ***

${cpf} =                        Convert To Number		                  12345675209
${phone} =                      Convert To Number                         11933998877
${Plate} =                                                                YOU0000
${CEP} =                        Convert To Number                         04538133
${AddressNumber} =                                                        90
${card}                                                                   4111 1111 1111 1111
${date}                                                                   0330
${cardname}                                                               John Hohn
${cvv}                                                                    737
${email}                                                                  km@youse.com.br