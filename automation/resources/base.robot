*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary        locale=pt_BR

*** Variables  ***
${cpf2}                                Convert To Number        12345675802
${url_auto_km}                         https://qa-cotacao.youse.io  
${CPF}                                 Convert To Number		                  12345675802
${Plate}                               YOU0000
${CEP}                                 Convert To Number                         04538133
${AddressNumber}                                                          920
${card}                                                                   4111 1111 1111 1111
${date}                                                                   0330
${cvv}                                                                    737
${email}                                                                  laylla+rake10@youse.com.br
${vin}                                                                    9BD135019B2176469
${senha_auto}                                                             Youse123*
${name}                                                                   Mauro Youser
${CI_Number}                                                              5631910303657-4
${vin_brand_new}                                                          9BGEA48A0LG248456
${result} 
${url_manager}              https://stage-manager.youse.io
# ${email}                  km@youse.com.br
${password}                 Jesus777*
${vin_brand_new}            9BGEA48A0LG248456
${motivo_cancelamento}      falta de pagamento
${url_auto}                 https://qa.youse.io/seguro-auto/
${email_manager}            laylla.rodrigues@youse.com.br
${password_manager}         Jesus777* 


*** Keywords ***

Nova sessão auto
    Set Selenium Timeout                        30s
    Open Browser                       ${url_auto}      chrome

Nova sessão manager

    Set Selenium Timeout                        30s
    Open Browser                       ${url_manager}/employees/sign_in      chrome

Nova sessão auto km
    Set Selenium Timeout                        30s
    Open Browser                        ${url_auto_km}/seguro-auto-por-km           chrome

Encerra sessão
    Capture Page Screenshot
    Close All Browsers

Validando que estou na tela inicial

    ${tela_login}                                   Get Locations
    Location Should Contain                         seguro-auto-por-km


DADO que preenchi os dados do segurado e motorista 
    [Arguments]          ${name}    ${CPF}      ${email}        
    
    ${name}                     FakerLibrary.Name
    ${TELEFONEFAKE}             FakerLibrary.Phone Number

    # sleep  2
    Input Text                                  css:input[id="insuredPersonName"]           ${name}
    Click Element                               css:input[type='tel']       
    Input Text                                  css:input[type='tel']                        ${CPF}
    Input Text                                  css:input[type='email']                      ${email}
    sleep     10
    Input Text                                  css:input[type='phone']                      ${TELEFONEFAKE}
    # sleep   1
    Click Element                               id:insuredPersonMaritalStatus                        
    Click Element                               css:li[role="option"][data-value="single"]  
    # Click Element                               xpath://*[@id="root"]/div[2]/div/div[8]/div/div[2]/div/label[2]/span[1]/span[1]/input
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


    Wait Until Element Is Visible               css:div[id="vehicleUsage"]
    Click Element                               css:div[id="vehicleUsage"] 

    # sleep    1

    Wait Until Element Is Visible               xpath://*[@id="menu-"]/div[3]/ul/li[1]
    Click Element                               xpath://*[@id="menu-"]/div[3]/ul/li[1]

    # sleep    1
    

    Wait Until Element Is Visible               css:div[id="vehicleOwnershipStatus"]
    Click Element                               css:div[id="vehicleOwnershipStatus"]

    # sleep    1
    Click Element                               css:li[data-value="owned_by_person"]    

E informei que meu carro é 0km 
    Click Element       xpath://*[@id="root"]/div[2]/div/div[9]/div[8]/div/div[2]/div/label[1]/span[1]/span[1]

E informei os dados de pernoite
    [Arguments]                                 ${CEP}      ${AddressNumber}

    # sleep   2s

    Wait Until Element Is Visible               css:input[id="insuredPersonAddressNeighborhood"]
    Click Element                               css:input[id="insuredPersonAddressNeighborhood"]
    Input Text                                  css:input[id="insuredPersonAddressNumber"]                                          ${AddressNumber}
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[15]/div/div[2]/div/label[1]/span[1]/span[1]

    
    # sleep   1s
    
    Wait Until Element Is Visible               xpath://*[@id="root"]/div[2]/div/div[13]/div[2]/div/div[2]/div/input 
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[13]/div[2]/div/div[2]/div/input 
    Input Text                                  xpath://*[@id="root"]/div[2]/div/div[13]/div[2]/div/div[2]/div/input                ${CEP}
    Click Element                               css:input[id="insuredPersonAddressNeighborhood"]


    

    # sleep   1s

    Wait Until Element Is Visible               css:button[class="sc-fnVZcZ kApXCP"]
    Click Element                               css:button[class="sc-fnVZcZ kApXCP"]

E selecionei o plano

    # sleep       6s
    Wait Until Element Is Visible               css:button[class="sc-fnVZcZ jirKkk"]
    Click Element                               css:button[class="sc-fnVZcZ jirKkk"]
    # sleep       3s

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

    # Wait Until Element Is Visible            xpath://*[@id="container"]/div[4]/section/div[1]
    # Click Element                            xpath://*[@id="container"]/div[4]/section/div[1]



ENTÃO devo visualizar a tela de sucesso AUTO CONVENCIONAL

    ${tela_sucesso}                                 Get Locations
    Location Should Contain                         insurance_policies
    Input Text                                      css:input[id="user_password"]                       ${senha_auto}
    Input Text                                      css:input[id="user_password_confirmation"]          ${senha_auto}
    Click Element                                   css:input[value="finalizar cadastro"]

    
   





E confirmar o email 
    [Arguments]                                 ${email}
    Input Text                                  css:input[id="insuredPersonEmailConfirm"]         ${email}

E encerrar a compra
    Wait Until Element Is Visible               css:button[class="sc-fnVZcZ kApXCP"]
    Click Element                               css:button[class="sc-fnVZcZ kApXCP"]
Aguardando sucesso da keyword Então
    ${result}           Wait Until Keyword Succeeds     2x	        15s	    ENTÃO devo visualizar a tela de sucesso 
Aguardando sucesso da keyword Então CONVENCIONAL
    ${result}           Wait Until Keyword Succeeds     2x	        15s	        ENTÃO devo visualizar a tela de sucesso AUTO CONVENCIONAL
 

ENTÃO devo visualizar a tela de sucesso 

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
 
    Wait Until Element Is Visible       css:div[role="button"][id="vehicleYear"]
    Click Element                       css:div[role="button"][id="vehicleYear"]

    Wait Until Element Is Visible       xpath://*[@id="menu-"]/div[3]/ul/li[3]
    Click Element                       xpath://*[@id="menu-"]/div[3]/ul/li[3]

    # sleep   1s

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

    # sleep   2
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
    

    # sleep     3s
    Input Text                                  css:input[id="insuredPersonName"]           ${name}
    Click Element                               css:input[type='tel']       
    Input Text                                  css:input[type='tel']                        ${CPF}
    Input Text                                  css:input[type='email']                      ${email}
    Input Text                                  css:input[type='phone']                      ${TELEFONEFAKE}
    Click Element                               id:insuredPersonMaritalStatus                        
    Click Element                               css:li[role="option"][data-value="single"]  

    Wait Until Element Is Visible               xpath://*[@id="root"]/div[2]/div/div[8]/div/div[2]/div/label[1]/span[1]/span[1]
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[8]/div/div[2]/div/label[1]/span[1]/span[1] 
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[8]/div/div[2]/div/label[2]/span[1]/span[1]/input


    
    Input Text                                  css:input[id="driverName"][class="jss5"]         ${name}  

    Click Element                               xpath://*[@id="root"]/div[2]/div/div[9]/div[3]/div/div[2]      
    Input Text                                  xpath://*[@id="root"]/div[2]/div/div[9]/div[3]/div/div[2]/div/input                             ${CPF}

    Click Element                               xpath://*[@id="root"]/div[2]/div/div[9]/div[4]/div/div/div/div
    Click Element                               css:li[role="option"][data-value="single"]  

E informei endereço
    [Arguments]                                 ${CEP}      ${AddressNumber}
    # sleep   2s
    Wait Until Element Is Visible               xpath://*[@id="root"]/div[2]/div/div[14]/div[2]/div/div[2]
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[14]/div[2]/div/div[2]
    Input Text                                  xpath://*[@id="root"]/div[2]/div/div[14]/div[2]/div/div[2]/div/input                ${CEP}
                                            
    Input Text                                  xpath://*[@id="insuredPersonAddressNumber"]                                         ${AddressNumber}

    ${bairro}                                   Get Text        xpath://*[@id="insuredPersonAddressNeighborhood"] 
    Wait Until Element Contains                 xpath://*[@id="insuredPersonAddressNeighborhood"]       ${bairro}


    Wait Until Element Is Visible               xpath://*[@id="root"]/div[2]/div/div[16]/div/div[2]/div/label[1]/span[1]/span[1]
    Click Element                               xpath://*[@id="root"]/div[2]/div/div[16]/div/div[2]/div/label[1]/span[1]/span[1]
    
    # sleep   3s

    Click Element                               xpath://*[@id="root"]/div[2]/div/div[17]/div/div[2]/span/div/button




DADO que preencho email e senha 
    input text                       css:input[id="employee_email"]         ${email_manager}
    input text                       css:input[id="employee_password"]      ${password_manager}

E cliquei em entrar

    Scroll Element Into View         css:input[name="commit"][value="entrar"]
    Click Element                    css:input[name="commit"][value="entrar"]

E informei chassi que desejo encontrar

    Wait Until Element Is Visible     css:input[id="q"][name="q"]
    input text                        css:input[id="q"][name="q"]       ${vin}
    Click Element                     css:input[name="commit"][value="OK"]
    Click Element                     xpath://*[@id="container"]/div[2]/section/div/table/tbody/tr/td[2]

    Wait Until Element Is Visible     xpath://*[@id="container"]/section[14]
    Scroll Element Into View          xpath://*[@id="container"]/section[14]
    Click Element                     xpath://*[@id="container"]/section[14]/div/p/a

    Wait Until Element Is Visible     css:select[id="insurance_policy_cancellation_requester"]
    Double Click Element              css:select[id="insurance_policy_cancellation_requester"]

    Wait Until Element Is Visible     css:option[value="company"]
    Click Element                     css:option[value="company"]


    Wait Until Element Is Visible     css:select[id="insurance_policy_cancellation_integration_id"]
    Double Click Element              css:select[id="insurance_policy_cancellation_integration_id"]


    Wait Until Element Is Visible            css:option[value="11"]
    Click Element                            css:option[value="11"]

    input text                        css:textarea[id="insurance_policy_cancellation_description"]          ${motivo_cancelamento}

    Click Element                     css:input[name="commit"][value="Continuar"]

    Click Element                     css:input[name="commit"][value="Confirmar Cancelamento"]

    Wait Until Element Is Visible     xpath://*[@id="container"]/section[3]/div/p[3]/a     
    Click Element                     xpath://*[@id="container"]/section[3]/div/p[3]/a

    Wait Until Element Is Visible     css:input[name="commit"][value="Confirmar Cancelamento"]
    Click Element                     css:input[name="commit"][value="Confirmar Cancelamento"]


    Page Should Contain                       Beleza! Foi concluída a solicitação de cancelamento da apólice.


Dado que selecionei cotar auto 
    Wait Until Element Is Enabled    xpath://*[@id="gatsby-focus-wrapper"]/main/div[1]/div/div/div/div/div[2]/span/a/div/div[2]/button
    Click Element       xpath://*[@id="gatsby-focus-wrapper"]/main/div[1]/div/div/div/div/div[2]/span/a/div/div[2]/button
    # Click Element       xpath://*[@id="gatsby-focus-wrapper"]/main/div[2]/div/div/div[2]/div/div/div[2]/div/div/div[3]/div/span/a


E passei os dados do segurado     
    ${name}                     FakerLibrary.Name
    ${TELEFONEFAKE}             FakerLibrary.Phone Number

    Wait Until Element Is Visible        css:input[id="auto_order_flow_lead_person_data_lead_person_attributes_name"]
    
    input text                          css:input[id="auto_order_flow_lead_person_data_lead_person_attributes_name"]        ${name}

    Wait Until Element Is Visible       css:input[id="auto_order_flow_lead_person_data_lead_person_attributes_email"]

    input text                          css:input[id="auto_order_flow_lead_person_data_lead_person_attributes_email"]        ${email}

    Wait Until Element Is Visible       css:input[id="auto_order_flow_lead_person_data_lead_person_attributes_phone"]
    input text                          css:input[id="auto_order_flow_lead_person_data_lead_person_attributes_phone"]       ${TELEFONEFAKE}

    Wait Until Element Is Visible       css:input[value="Continuar"]
    Click Element                       css:input[value="Continuar"]

E informei a placa e dados do veiculo
    Wait Until Element Is Visible    xpath://*[@id="auto_order_flow_pricing_requirements_vehicle_attributes_license_plate_or_vin"]
    input text                       xpath://*[@id="auto_order_flow_pricing_requirements_vehicle_attributes_license_plate_or_vin"]       YOU0000

    sleep    2

    Click Element    xpath://*[@id="vehicle-usage-section"]/fieldset/div/div[1]

    Wait Until Element Is Visible        css:label[class="radio-button__fake-radio"][for="bullet_proof_false"]

    Click Element    css:label[class="radio-button__fake-radio"][for="bullet_proof_false"]

    Input text       xpath://*[@id="auto_order_flow_pricing_requirements_vehicle_attributes_address_attributes_zipcode"]     04538-133
    click Element    xpath://*[@id="auto_order_flow_pricing_requirements_vehicle_attributes_address_attributes_number"]

    # sleep    2
    Input text        xpath://*[@id="auto_order_flow_pricing_requirements_vehicle_attributes_address_attributes_number"]    90

    Input text        css:input[id="auto_order_flow_pricing_requirements_insured_person_attributes_cpf"]        123.456.758-02

    Wait Until Element Is Visible        css:label[class="radio-button__fake-radio"][for="has_insurance_false"] 

    Click Element        css:label[class="radio-button__fake-radio"][for="has_insurance_false"] 
        
    Click Element    css:label[class="radio-button__fake-radio"][for="product_consent_false"]

    Click Element    css:input[type="submit"][name="commit"]

    Wait Until Element Is Visible        xpath://*[@id="modal_01"]/div[4]/a[1]
    Click Element    xpath://*[@id="modal_01"]/div[4]/a[1]



E escolhi o plano basico
    Wait Until Element Is Visible        xpath://*[@id="preformatted-coverages-auto-plans-11"]/div[1]/button
    Click Element    xpath://*[@id="preformatted-coverages-auto-plans-11"]/div[1]/button



Quando os dados de pagamento forem preenchidos corretamente
    ${name}                                    FakerLibrary.Name
 
    # Wait Until Element Is Visible              css:input[name="email"][id="email"]
    # Input Text                                 css:input[name="email"][id="email"]        ${email}
 
    # Click Element                              css:input[value="próximo passo"]
 
    # Wait Until Element Is Visible              css:input[name="user[password]"][id="user_password"]
    # Input Text                                 css:input[name="user[password]"][id="user_password"]        Youse123*
 
    # Scroll Element Into View                   css:a[class="button button--secondary"][tabindex="7"]
  
    # Click Element                              css:input[name="commit"][value="entrar"]


    Wait Until Element Is Visible              css:li[data-offer-refused-all]
    Click Element                              css:li[data-offer-refused-all]
   
 
    Wait Until Element Is Visible              xpath://*[@id="component-container"]/div/div/div[2]/div[1]/div[1]/label/span[2]/span
    Scroll Element Into View                   xpath://*[@id="component-container"]/div/div/div[2]/div[1]/div[1]/label/span[2]/span
 
    Select Frame                               css:iframe[class="js-iframe"][title="Iframe for secured card data input field"]
    Wait Until Element Is Visible              css:input[class="js-iframe-input input-field"][id="encryptedCardNumber"]
    Input Text                                 css:input[class="js-iframe-input input-field"][id="encryptedCardNumber"]                     ${card}
    Unselect Frame      
 
    Select Frame                                xpath://*[@id="component-container"]/div/div/div[2]/div[1]/div[2]/div[1]/label/span[2]/span/iframe
    Wait Until Element Is Visible               css:input[class="js-iframe-input input-field"][id="encryptedExpiryDate"]
    Input Text                                  css:input[class="js-iframe-input input-field"][id="encryptedExpiryDate"]                     ${date}
    Unselect Frame                              
 
    Select Frame                                xpath://*[@id="component-container"]/div/div/div[2]/div[1]/div[2]/div[2]/label/span[2]/span/iframe
    Wait Until Element Is Visible               xpath://*[@id="encryptedSecurityCode"]
    Input Text                                  xpath://*[@id="encryptedSecurityCode"]                    ${cvv}
    Unselect Frame                               

    Input Text                                  css:input[placeholder="Nome como no cartão"]      ${name}

    Input Text                                  css:input[id="auto_order_flow_payment_data_insured_person_attributes_confirmation_email"]    ${email}

    Click Element                               css:input[id="auto_order_flow_payment_data_insured_person_attributes_email"]

    Click Element                               css:input[value="Finalizar compra"]


E informei os dados do veiculo

    Wait Until Element Is Visible       css:id="auto_order_flow_pricing_requirements_vehicle_attributes_license_plate_or_vin"
    input text                          css:id="auto_order_flow_pricing_requirements_vehicle_attributes_license_plate_or_vin"       ${Plate}

    Click Element                        css:div[data-value="auto|private"]

    Click Element                        css:label[class="radio-button__fake-radio"][for="bullet_proof_true"]

E os dados de pernoite

    Wait Until Element Is Visible        css:input[id="auto_order_flow_pricing_requirements_vehicle_attributes_address_attributes_zipcode"]
    input text                           css:input[id="auto_order_flow_pricing_requirements_vehicle_attributes_address_attributes_zipcode"]     ${CEP}

    





