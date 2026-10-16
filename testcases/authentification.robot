*** Settings ***
Resource    ../resources/authentification.robot

Test Setup       Ouverture Navigateur
Test Teardown    Fermer Le Navigateur

*** Variables ***
${VIDE}    ${EMPTY}

*** Test Cases ***

Cas1 Login Correct Et Mot De Passe Vide
    [Tags]    smoke    auth

    Connexion
    ...    admin@robotframeworktutorial.com
    ...    ${VIDE}

    Verifier Mot De Passe Obligatoire

    Log To Console
    ...    [SUCCES] Mot de passe obligatoire détecté

Cas2 Login Incorrect Et Mot De Passe Correct
    [Tags]    sanity    auth

    Connexion
    ...    fauxemail.com
    ...    pwd

    Verifier Email Invalide

    Log To Console
    ...    [SUCCES] Email invalide détecté

Cas3 Login Valide
    [Tags]    regression    auth

    Connexion
    ...    admin@robotframeworktutorial.com
    ...    pwd

    Verifier Connexion Reussie

    Log To Console
    ...    [SUCCES] Connexion réussie