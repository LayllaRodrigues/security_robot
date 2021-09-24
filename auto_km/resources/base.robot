*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary        locale=pt_BR

*** Variables  ***
${url}                         https://qa-cotacao.youse.io  
${CPF}                         Convert To Number		                  12345675209
${Plate}                                                                  YOU0000
${CEP}                          Convert To Number                         04538133
${AddressNumber}                                                          900
${card}                                                                   4111 1111 1111 1111
${date}                                                                   0330
${cvv}                                                                    737
${email}                                                                  km1@youse.com.br
${vin}                                                                    3N1BC1CD1DK193023
${name}                                                                   John Youser
${CI_Number}                                                              5631910303657-4

*** Keywords ***
Nova sessão
    Open Browser                       ${url}/seguro-auto-por-km           chrome

Encerra sessão
    Capture Page Screenshot
    Close All Browsers

Validando que estou na tela inicial

    ${tela_login}                                   Get Locations
    Location Should Contain                         seguro-auto-por-km


DADO que preenchi os dados do segurado e motorista 
    [Arguments]          ${name}    ${CPF}      ${email}    ${TELEFONEFAKE}     
    
    ${name}                     FakerLibrary.Name
    ${TELEFONEFAKE}             FakerLibrary.Phone Number


    Wait Until Element Is Visible               css:input[id="insuredPersonName"] 
    Input Text                                  css:input[id="insuredPersonName"]           ${name}
    Click Element                               css:input[type='tel']       
    Input Text                                  css:input[type='tel']                        ${CPF}
    Input Text                                  css:input[type='email']                      ${email}
    Input Text                                  css:input[type='phone']                      ${TELEFONEFAKE}
    Click Element                               id:insuredPersonMaritalStatus                        
    Click Element                               css:li[role="option"][data-value="single"]  
    Wait Until Element Is Visible               xpath://*[@id="root"]/div[2]/div/div[8]/div/div[2]/div/label[1]/span[1]/span[1]
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[8]/div/div[2]/div/label[2]/span[1]/span[1]/input
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[8]/div/div[2]/div/label[1]/span[1]/span[1] 

E informei placa e versao do carro
    [Arguments]                                 ${Plate}
   
   
    Wait Until Element Is Visible               css:input[id=vehicleLicensePlate]                        
    Click Element                               css:input[id=vehicleLicensePlate]          
    Input Text                                  css:input[id=vehicleLicensePlate]                                                ${Plate}
    Click Element                               css:div[errorfor="vehicleLicensePlate"]                             
    # Wait Until Element Is Visible               class:hZdnym

E informei vin e versao do carro
    [Arguments]             ${vin}   
    Wait Until Element Is Visible               xpath://*[@id="root"]/div[2]/div/div[9]/div[2]/div/div[2]/div/label[2]/span[1]
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[9]/div[2]/div/div[2]/div/label[2]/span[1] 
    Wait Until Element Is Visible               css:input[id=vehicleVin][type="text"]                       
    Click Element                               css:input[id=vehicleVin][type="text"]          
    Input Text                                  css:input[id=vehicleVin][type="text"]       ${vin}   
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[9]/div[2]/div/div[2]/div/label[2]/span[1]
    Wait Until Element Is Visible               xpath://*[@id="root"]/div[2]/div/div[9]/div[5]/div/div[1]/div/div[1]/span
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[9]/div[5]/div/div[1]/div/div[1]/span

E selecionei o tipo de dono e uso do carro 

    sleep   2s

    Wait Until Element Is Visible               css:div[id="vehicleUsage"]
    Click Element                               css:div[id="vehicleUsage"] 

    # Wait Until Element Is Visible               css:li[data-value="only_private"]
    # Click Element                               css:li[data-value="only_private"]

    Wait Until Element Is Visible               xpath://*[@id="menu-"]/div[3]/ul/li[1]
    Click Element                               xpath://*[@id="menu-"]/div[3]/ul/li[1]

    Wait Until Element Is Visible               css:div[id="vehicleOwnershipStatus"]
    Click Element                               css:div[id="vehicleOwnershipStatus"]

    Click Element                               css:li[data-value="owned_by_person"]    
    Click Element                               css:li[data-value="owned_by_person"]   

E informei que meu carro é 0km 
    Click Element       xpath://*[@id="root"]/div[2]/div/div[9]/div[8]/div/div[2]/div/label[1]/span[1]/span[1]

E informei os dados de pernoite

    Sleep   1
    [Arguments]                                 ${CEP}      ${AddressNumber}

    sleep   3s

    Wait Until Element Is Visible               css:div[spacing="[object Object]"][class="sc-dlnjwi kVWFtv"]
    Click Element                               css:div[spacing="[object Object]"][class="sc-dlnjwi kVWFtv"]
    Input Text                                  xpath://*[@id="root"]/div[2]/div/div[13]/div[2]/div/div[2]/div/input                ${CEP}

    sleep   3s
    
    Click Element                               css:input[id="insuredPersonAddressNeighborhood"]
    Input Text                                  css:input[id="insuredPersonAddressNumber"]                                          ${AddressNumber}
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[15]/div/div[2]/div/label[1]/span[1]/span[1]

    sleep   3s

    Wait Until Element Is Visible               css:button[class="sc-fnVZcZ kApXCP"]
    Click Element                               css:button[class="sc-fnVZcZ kApXCP"]

E selecionei o plano

    sleep       5s
    Wait Until Element Is Visible               css:button[class="sc-fnVZcZ jirKkk"]
    Click Element                               css:button[class="sc-fnVZcZ jirKkk"]


QUANDO eu preencher os dados do cartão de crédito 
    [Arguments]                                ${card}       ${date}      ${cvv}      ${name} 
    ${name}                                    FakerLibrary.Name

    Wait Until Element Is Visible              css:iframe[class="js-iframe"][title="Iframe para número de cartão seguro"]
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

    Input Text                                  css:input[placeholder="Nome como no cartão"]      ${name}

E confirmar o email 
    [Arguments]                                 ${email}
    Input Text                                  css:input[id="insuredPersonEmailConfirm"]         ${email}

E encerrar a compra
    Wait Until Element Is Visible               css:button[class="sc-fnVZcZ kApXCP"]
    Click Element                               css:button[class="sc-fnVZcZ kApXCP"]

ENTÃO devo visualizar a tela de sucesso 
    sleep       20s
    ${tela_sucesso}                                 Get Locations
    Location Should Contain                         sucesso

E informei dados do carro


    Wait Until Element Is Visible       css:button[tabindex="0"][type="button"]
    Click Element                       css:button[tabindex="0"][type="button"]

    Click Element                       css:div[role="button"][id="vehicleMake"]
    Wait Until Element Is Visible       css:li[tabindex="-1"][data-value="AUDI"]

    Click Element                       css:li[tabindex="-1"][data-value="AUDI"]
    Click Element                       xpath://*[@id="root"]/div[2]/div/div[9]/div[2]/div/div[3]/div/div/div/div

    Wait Until Element Is Visible       css:li[tabindex="-1"][data-value="A4"]
    Click Element                       css:li[tabindex="-1"][data-value="A4"]
 

    Click Element                       css:div[role="button"][id="vehicleYear"]
    Wait Until Element Is Visible       css:li[tabindex="-1"][data-value="2019"]
    Click Element                       css:li[tabindex="-1"][data-value="2019"]


    Scroll Element Into View                     css:div[id="vehicleOwnershipStatus"]
    Click Element                                css:div[id="vehicleVersion"]
    Wait Until Element Is Visible                xpath://*[@id="menu-"]/div[3]/ul/li[2]
    Click Element                                xpath://*[@id="menu-"]/div[3]/ul/li[2]
    
E visualizei o frame solicitando a placa
    Wait Until Element Is Visible       css:div[class="sc-dlnjwi hDgBAQ"]
    Click Element                       css:div[class="sc-dlnjwi hDgBAQ"]

E fui até o campo placa
    Wait Until Element Is Visible       css:label[class="sc-bdnxRM eVZHVS"][for="vehicleLicensePlate"]
    Scroll Element Into View            css:label[class="sc-bdnxRM eVZHVS"][for="vehicleLicensePlate"]

    
E realizei aceite LGPD

    Wait Until Element Is Visible               xpath://*[@id="root"]/div[2]/div/div[16]/div/div[2]/div/label[1]/span[1]
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[16]/div/div[2]/div/label[1]/span[1]

E ok
    Wait Until Element Is Visible               css:button[class="sc-fnVZcZ kApXCP"]
    Click Element                               css:button[class="sc-fnVZcZ kApXCP"]
    
E informei os dados da minha classe de bonus   

    Scroll Element Into View            xpath://*[@id="root"]/div[2]/div/div[12]/div[2]/div[2]/div/div[2]

    Wait Until Element Is Visible       xpath://*[@id="root"]/div[2]/div/div[12]/div[2]/div[2]/div/div[2]/div/label[1]/span[1]
    Click Element                       xpath://*[@id="root"]/div[2]/div/div[12]/div[2]/div[2]/div/div[2]/div/label[1]/span[1]

    Scroll Element Into View            xpath://*[@id="root"]/div[2]/div/div[12]/div[2]/div[3]/div/div[2]

    Wait Until Element Is Visible       xpath://*[@id="root"]/div[2]/div/div[12]/div[2]/div[3]/div/div[2]/div/label[1]/span[1]
    Click Element                       xpath://*[@id="root"]/div[2]/div/div[12]/div[2]/div[3]/div/div[2]/div/label[1]/span[1]

    Click Element                       css:div[tabindex="0"][id="driverUserBonusesClass"]
    Click Element                       css:li[data-value="4"]

    Input Text                          xpath://*[@id="root"]/div[2]/div/div[12]/div[2]/div[5]/div/div[4]/div/div[2]/div/input              ${CI_Number}

E visualizei o retorno da consulta farway
    Wait Until Element Is Visible       css:div[class="sc-dlnjwi hDgBAQ"]
    Click Element                       css:div[class="sc-dlnjwi hDgBAQ"]

DADO que preenchi os dados do segurado e segundo motorista 
    [Arguments]          ${name}    ${CPF}      ${email}    ${TELEFONEFAKE}     
    
    ${name}                     FakerLibrary.Name
    ${TELEFONEFAKE}             FakerLibrary.Phone Number
    


    Wait Until Element Is Visible               css:input[id="insuredPersonName"] 
    Input Text                                  css:input[id="insuredPersonName"]           ${name}
    Click Element                               css:input[type='tel']       
    Input Text                                  css:input[type='tel']                        ${CPF}
    Input Text                                  css:input[type='email']                      ${email}
    Input Text                                  css:input[type='phone']                      ${TELEFONEFAKE}
    Click Element                               id:insuredPersonMaritalStatus                        
    Click Element                               css:li[role="option"][data-value="single"]  
    
    Input Text                                   css:input[id="driverName"][class="jss5"]         ${name}  

    Click Element                               xpath://*[@id="root"]/div[2]/div/div[9]/div[3]/div/div[2]      
    Input Text                                  xpath://*[@id="root"]/div[2]/div/div[9]/div[3]/div/div[2]/div/input                             ${CPF}

    Click Element                               xpath://*[@id="root"]/div[2]/div/div[9]/div[4]/div/div/div/div
    Click Element                               css:li[role="option"][data-value="single"]  
