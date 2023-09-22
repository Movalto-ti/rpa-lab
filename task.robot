*** Settings ***
Library  RPA.Browser.Selenium



*** Variables ***
${text}    Prueba



*** Test Cases ***
ejecucion
    mostrar_texto
    Open Browser  google.com.co  Chrome
    Sleep  10s


*** Keywords ***
mostrar_texto
    Log  Done.
    Log  ${text}