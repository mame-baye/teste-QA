*** Settings ***
Library    SeleniumLibrary

Variables    ../pageobject/locator.py
Variables    ../pageobject/variables.py

*** Keywords ***

Ouverture Navigateur
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fermer Le Navigateur
    Close Browser

Connexion
    [Arguments]    ${email}    ${password}

    Click Element    ${btn_signin}

    Wait Until Element Is Visible    ${txt_email}    10s

    Input Text        ${txt_email}       ${email}
    Input Password    ${txt_password}    ${password}

    Click Button      ${btn_submit}

    Sleep    2s

Verifier Mot De Passe Obligatoire
    ${message}=    Execute JavaScript
    ...    return document.getElementById('password').validationMessage;

    Should Contain    ${message}    Veuillez rense

Verifier Email Invalide
    ${message}=    Execute JavaScript
    ...    return document.getElementById('email-id').validationMessage;

    Should Contain    ${message}    Veuillez inclu

Verifier Connexion Reussie
    Page Should Contain    Customers

Creer Un Nouvel Utilisateur
    Click Link    New Customer

    ${timestamp}=    Get Time    epoch

    Input Text    id=EmailAddress    robot${timestamp}@test.com
    Input Text    id=FirstName       pas
    Input Text    id=LastName        tout
    Input Text    id=City            Dakar

    Select From List By Label
    ...    id=StateOrRegion
    ...    Texas

    Select Radio Button    gender    male

    Wait Until Element Is Visible    xpath=//button[@type='submit']
    Wait Until Element Is Enabled    xpath=//button[@type='submit']

    Scroll Element Into View         xpath=//button[@type='submit']
    Sleep    1s

    Click Element    xpath=//button[@type='submit']

    Log To Console    [SUCCES] Utilisateur créé avec succès