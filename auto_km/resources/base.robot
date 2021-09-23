*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary        locale=pt_BR

*** Variables  ***
${url}                   https://stage-cotacao.youse.io  
${CPF}                         Convert To Number		                  12345675209
${Plate}                                                                  YOU0000
${CEP}                          Convert To Number                         04538133
${AddressNumber}                                                          90
${card}                                                                   4111 1111 1111 1111
${date}                                                                   0330
${cvv}                                                                    737
${email}                                                                  km1@youse.com.br
${vin}                                                                    3N1BC1CD1DK193023
${name}                                                                   John Youser


*** Keywords ***

Nova sessão
    Open Browser                       ${url}/seguro-auto-por-km           chrome

Encerra sessão
    Capture Page Screenshot
    Close All Browsers

# Preenchendo nome do segurado 
#     [Arguments]          ${name}
#     ${name}                     FakerLibrary.Name

#     Wait Until Element Is Visible               css:input[id="insuredPersonName"] 
#     Input Text                                  css:input[id="insuredPersonName"]           ${name}
           

# Preenchendo CPF do segurado
#     [Arguments]          ${CPF}
#     Click Element                               css:input[type='tel']
#     Input Text                                  css:input[type='tel']                                                             ${CPF}

# Preenchendo E-mail do segurado             
#     [Arguments]          ${email}
#     Input Text                  css:input[type='email']        ${email}


# Preenchendo Telefone do segurado
#     [Arguments]                                 ${TELEFONEFAKE}
#     ${TELEFONEFAKE}                             FakerLibrary.Phone Number

#     Input Text                                  css:input[type='phone']                                                           ${TELEFONEFAKE}


# Selecionando status civil 
#     Click Element                             id:insuredPersonMaritalStatus                        
#     Click Element                             css:li[role="option"][data-value="single"]  

# Informando se o segurado é o motorista 
#     Wait Until Element Is Visible               xpath://*[@id="root"]/div[2]/div/div[8]/div/div[2]/div/label[1]/span[1]/span[1]
#     Click Element                               xpath://*[@id="root"]/div[2]/div/div[8]/div/div[2]/div/label[2]/span[1]/span[1]/input
#     Click Element                               xpath://*[@id="root"]/div[2]/div/div[8]/div/div[2]/div/label[1]/span[1]/span[1] 

# Informando placa

#     [Arguments]             ${Plate}
#     Wait Until Element Is Visible               css:input[id=vehicleLicensePlate]                        
#     Click Element                               css:input[id=vehicleLicensePlate]          
#     Input Text                                  css:input[id=vehicleLicensePlate]                                                ${Plate}
#     Click Element                               css:div[errorfor="vehicleLicensePlate"]                             
#     Element Should Be Visible                   class:hZdnym


# Selecionando tipo de uso do carro
#     Wait Until Element Is Visible               css:div[id="vehicleUsage"]
#     Click Element                               css:div[id="vehicleUsage"] 
#     Wait Until Element Is Visible               xpath://*[@id="menu-"]/div[3]/ul/li[1]
#     Click Element                               xpath://*[@id="menu-"]/div[3]/ul/li[1]

# Selecionando tipo de dono do carro
#     Wait Until Element Is Visible               css:div[id="vehicleOwnershipStatus"]
#     Click Element                               css:div[id="vehicleOwnershipStatus"]
#     Click Element                               css:li[data-value="owned_by_person"]    
#     Click Element                               css:li[data-value="owned_by_person"]      

# Informando CEP
#     Sleep   1
#     [Arguments]                                 ${CEP}  

#     Wait Until Element Is Visible               css:div[spacing="[object Object]"][class="sc-dlnjwi kVWFtv"]
#     Click Element                               css:div[spacing="[object Object]"][class="sc-dlnjwi kVWFtv"]
#     Input Text                                  xpath://*[@id="root"]/div[2]/div/div[13]/div[2]/div/div[2]/div/input                ${CEP}


# Informando numero do endereço de pernoite
#     [Arguments]                                 ${AddressNumber}
#     Click Element                               css:input[id="insuredPersonAddressNeighborhood"]
#     Input Text                                  css:input[id="insuredPersonAddressNumber"]                                          ${AddressNumber}
#     Click Element                               xpath://*[@id="root"]/div[2]/div/div[15]/div/div[2]/div/label[1]/span[1]/span[1]

# Clicando botton continuar
#     Wait Until Element Is Visible               css:button[class="sc-fnVZcZ kApXCP"]
#     Click Element                               css:button[class="sc-fnVZcZ kApXCP"]

# Selecionando plano 
#     Wait Until Element Is Visible               css:button[class="sc-fnVZcZ jirKkk"]
#     Click Element                               css:button[class="sc-fnVZcZ jirKkk"]

# Preenchendo cartão de crédito
#     [Arguments]                                ${card}
#     Wait Until Element Is Visible              css:iframe[class="js-iframe"][title="Iframe para número de cartão seguro"]
#     Select Frame                               css:iframe[class="js-iframe"][title="Iframe para número de cartão seguro"]
#     Wait Until Element Is Visible              css:input[class="js-iframe-input input-field"][id="encryptedCardNumber"]
#     Input Text                                 css:input[class="js-iframe-input input-field"][id="encryptedCardNumber"]                     ${card}
#     Unselect Frame       

# Preenchendo data de validade do cartão
#     [Arguments]                                 ${date}
#     Select Frame                                css:iframe[class="js-iframe"][title="Iframe para data de validade do cartão seguro"]
#     Wait Until Element Is Visible               css:input[class="js-iframe-input input-field"][id="encryptedExpiryDate"]
#     Input Text                                  css:input[class="js-iframe-input input-field"][id="encryptedExpiryDate"]                     ${date}
#     Unselect Frame            

# Preenchendo cvv 
#     [Arguments]                                  ${cvv}
#     Select Frame                                css:iframe[class="js-iframe"][title="Iframe para código de segurança do cartão seguro"]
#     Wait Until Element Is Visible               css:input[class="js-iframe-input input-field"][id="encryptedSecurityCode"]
#     Input Text                                  css:input[class="js-iframe-input input-field"][id="encryptedSecurityCode"]                    ${cvv}
#     Unselect Frame    

# Preenchendo nome do dono do cartão
#     [Arguments]         ${cardname}
#     Input Text                                  css:input[placeholder="Nome como no cartão"]                                             ${TEST_NAME}

# Confirmando email
#     [Arguments]         ${email}

#     Input Text                                  css:input[id="insuredPersonEmailConfirm"]                                                ${email}

# Realizando o pagamento e encerrando a compra 

#     Wait Until Element Is Visible               css:button[class="sc-fnVZcZ kApXCP"]
#     Click Element                               css:button[class="sc-fnVZcZ kApXCP"]

# Tela de sucesso 
#     Wait Until Page Contains                    Suas informações já estão em análise!
#     Page Should Contain                         Suas informações já estão em análise!

#     sleep       70s

# Selecionando vin
#     Wait Until Element Is Visible               xpath://*[@id="root"]/div[2]/div/div[9]/div[2]/div/div[2]/div/label[2]/span[1]
#     Click Element                               xpath://*[@id="root"]/div[2]/div/div[9]/div[2]/div/div[2]/div/label[2]/span[1]

# Informando Vin
#     [Arguments]             ${vin}   
#     Wait Until Element Is Visible               css:input[id=vehicleVin][type="text"]                       
#     Click Element                               css:input[id=vehicleVin][type="text"]          
#     Input Text                                  css:input[id=vehicleVin][type="text"]       ${vin}   
#     Click Element                               xpath://*[@id="root"]/div[2]/div/div[9]/div[2]/div/div[2]/div/label[2]/span[1]

# Selecionando versão vin
#     Wait Until Element Is Visible           xpath://*[@id="root"]/div[2]/div/div[9]/div[5]/div/div[1]/div/div[1]/span
#     Click Element                           xpath://*[@id="root"]/div[2]/div/div[9]/div[5]/div/div[1]/div/div[1]/span
 
# Selecionando versão plate
#     Wait Until Element Is Visible       xpath://*[@id="root"]/div[2]/div/div[9]/div[5]/div/div/div/div[1]/span
#     Click Element                       xpath://*[@id="root"]/div[2]/div/div[9]/div[5]/div/div/div/div[1]/span

# Selecionando botton não tenho placa
#     Wait Until Element Is Visible       css:button[tabindex="0"][type="button"]
#     Click Element                       css:button[tabindex="0"][type="button"]

# Selecionando marca do veiculo    
#     Click Element   css:div[role="button"][id="vehicleMake"]
#     Wait Until Element Is Visible   css:li[tabindex="-1"][data-value="AUDI"]
#     Click Element   css:li[tabindex="-1"][data-value="AUDI"]

# Selecionando modelo do veiculo
#     Click Element   xpath://*[@id="root"]/div[2]/div/div[9]/div[2]/div/div[3]/div/div/div/div
#     Wait Until Element Is Visible   css:li[tabindex="-1"][data-value="A4"]
#     Click Element   css:li[tabindex="-1"][data-value="A4"]

# Selecionando ano do veiculo
#     Click Element   css:div[role="button"][id="vehicleYear"]
#     Wait Until Element Is Visible   css:li[tabindex="-1"][data-value="2019"]
#     Click Element       css:li[tabindex="-1"][data-value="2019"]

# Selecionando versao do veiculo
#     Scroll Element Into View                     css:div[id="vehicleOwnershipStatus"]
#     Click Element   css:div[id="vehicleVersion"]
#     Wait Until Element Is Visible   xpath://*[@id="menu-"]/div[3]/ul/li[1]
#     Click Element       xpath://*[@id="menu-"]/div[3]/ul/li[1]

# Selecionando botton informar chassi e placa  
#     Wait Until Element Is Visible       css:[class="sc-jSFjdj dAoZsZ"
#     Click Element                       css:[class="sc-jSFjdj dAoZsZ"


# Autorizando envio de ofertas
#     Wait Until Element Is Visible       xpath://*[@id="root"]/div[2]/div/div[16]/div/div[2]/div/label[1]/span[1]
#     Click Element                       xpath://*[@id="root"]/div[2]/div/div[16]/div/div[2]/div/label[1]/span[1]

Dado que preenchi os dados do segurado e motorista 
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

    Wait Until Element Is Visible               css:div[id="vehicleUsage"]
    Click Element                               css:div[id="vehicleUsage"] 
    Wait Until Element Is Visible               xpath://*[@id="menu-"]/div[3]/ul/li[1]
    Click Element                               xpath://*[@id="menu-"]/div[3]/ul/li[1]
    Wait Until Element Is Visible               css:div[id="vehicleOwnershipStatus"]
    Click Element                               css:div[id="vehicleOwnershipStatus"]
    Click Element                               css:li[data-value="owned_by_person"]    
    Click Element                               css:li[data-value="owned_by_person"]      

E informei os dados de pernoite

    Sleep   1
    [Arguments]                                 ${CEP}      ${AddressNumber}
    Wait Until Element Is Visible               css:div[spacing="[object Object]"][class="sc-dlnjwi kVWFtv"]
    Click Element                               css:div[spacing="[object Object]"][class="sc-dlnjwi kVWFtv"]
    Input Text                                  xpath://*[@id="root"]/div[2]/div/div[13]/div[2]/div/div[2]/div/input                ${CEP}
    Click Element                               css:input[id="insuredPersonAddressNeighborhood"]
    Input Text                                  css:input[id="insuredPersonAddressNumber"]                                          ${AddressNumber}
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[15]/div/div[2]/div/label[1]/span[1]/span[1]

    Wait Until Element Is Visible               css:button[class="sc-fnVZcZ kApXCP"]
    Click Element                               css:button[class="sc-fnVZcZ kApXCP"]

E selecionei o plano
    Wait Until Element Is Visible               css:button[class="sc-fnVZcZ jirKkk"]
    Click Element                               css:button[class="sc-fnVZcZ jirKkk"]


Quando eu preencher os dados do cartão de crédito 
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

Então devo visualizar a tela de sucesso 
    Wait Until Page Contains                    Suas informações já estão em análise!
    Page Should Contain                         Suas informações já estão em análise!