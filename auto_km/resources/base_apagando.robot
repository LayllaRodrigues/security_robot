*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary        locale=pt_BR


*** Variables  ***
${url}              https://qa-manager.youse.io
${email}            laylla.rodrigues@youse.com.br
${password}         Jesus777*
${vin_brand_new}    9BGEA48A0LG248456
${motivo_cancelamento}      falta de pagamento


*** Keywords ***

Nova sessão

    Set Selenium Timeout                        30s
    Open Browser                       ${url}/employees/sign_in      chrome

Encerra sessão
    Close All Browsers

DADO que preencho email e senha 
    input text                       css:input[id="employee_email"]         ${email}
    input text                       css:input[id="employee_password"]      ${password}

E cliquei em entrar

    Scroll Element Into View         css:input[name="commit"][value="entrar"]
    Click Element                    css:input[name="commit"][value="entrar"]

E informei chassi que desejo encontrar

    Wait Until Element Is Visible     css:input[id="q"][name="q"]
    input text                        css:input[id="q"][name="q"]       ${vin_brand_new}
    Click Element                     css:input[name="commit"][value="OK"]
    Click Element                     xpath://*[@id="container"]/div[2]/section/div/table/tbody/tr/td[2]

    Wait Until Element Is Visible     xpath://*[@id="container"]/section[14]
    Scroll Element Into View          xpath://*[@id="container"]/section[14]
    Click Element                     xpath://*[@id="container"]/section[14]/div/p/a

    Wait Until Element Is Visible     css:select[id="insurance_policy_cancellation_requester"]
    Double Click Element              css:select[id="insurance_policy_cancellation_requester"]

    Wait Until Element Is Visible     css:option[value="company"]
    Click Element                     css:option[value="company"]

    # sleep   3

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



    sleep   29






