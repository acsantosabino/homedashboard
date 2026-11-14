*** Settings ***
Library    Collections
Library    OperatingSystem
Library    Requests

*** Variables ***
${BASE_URL}    http://localhost:5000

*** Keywords ***
Verificar resposta 200
    [Arguments]    ${response}
    Should Be Equal As Integers    ${response.status_code}    200

Criar payload de usuário
    [Arguments]    ${email}    ${senha}    ${nome}
    ${body}=    Create Dictionary    email=${email}    senha=${senha}    nome=${nome}
    [Return]    ${body}
