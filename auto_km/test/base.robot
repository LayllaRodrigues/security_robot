*** Settings ***
Library     SeleniumLibrary


*** Variables  ***
${url}                   https://stage-cotacao.youse.io/seguro-auto-por-km     

*** Keywords ***
Nova sessão
    Open Browser                       ${url}           chrome

Encerra sessão
    Capture Page Screenshot
    Close Browser