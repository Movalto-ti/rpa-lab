*** Settings ***
Library  RPA.Browser.Selenium
Library  RPA.Excel.Files
Library  RPA.Tables
Library  RPA.Email.ImapSmtp  smtp_server=smtp.gmail.com  smtp_port=587



*** Variables ***
${text}    Texto de prueba
${ORDERS_FILE}  rpa-lab/test_RPA.xlsx
${USERNAME}     luis.naranjo@movalto.com
${PASSWORD}     Luis.2110
${RECIPIENT}    ing.luisangeln@gmail.com



*** Test Cases ***
ejectutar_keyword_1
    ${users} =  Read users as table

    ${emails} =  Get Table Column  table=${users}  column=Email
    ${emails_string} =  Evaluate    ", ".join(${emails})
    # Log  RECIPIENTS - > ${emails_string}
    Send Email  emails= ${emails_string}





*** Keywords ***
Read users as table
    Log  Reading Excel file
    Open workbook   ${ORDERS_FILE}
    ${worksheet} =  Read Worksheet  header=${True}
    ${users} =  Create Table  ${worksheet}
    [Return]  ${users}
    [Teardown]  Close Workbook

Send Email
    [Arguments]  ${emails}
    Authorize  account=${USERNAME}  password=${PASSWORD}
    Send Message  sender=${USERNAME}
    ...    recipients= ${emails}
    ...    subject= Test de correo automatizado
    ...    body= este correo es de prueba, enviado automaticamente con robot framework

