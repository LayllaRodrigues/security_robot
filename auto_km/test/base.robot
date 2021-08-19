*** Settings ***
Library     SeleniumLibrary

*** Variables  ***
${url}                   https://www.youse.com.br/seguro-auto/por-km
*** Keywords ***
# Nova sessão
#     Open Browser                       ${url}           chrome

Encerra sessão
    Capture Page Screenshot
    Close Browser