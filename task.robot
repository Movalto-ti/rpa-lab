*** Settings ***
Library  RPA.Browser.Selenium




*** Variables ***
${text}    Texto de prueba




*** Test Cases ***
ejectutar_keyword_1
    mostrar_texto
    Open Browser  url=google.com.co  browser=Chrome
    Sleep  10s




*** Keywords ***
mostrar_texto
    Log  Done.
    Log  ${text}



