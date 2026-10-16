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