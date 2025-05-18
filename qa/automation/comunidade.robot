*** Settings ***
Documentation     Testes automatizados para Comunidade
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
Resource        resources/massas.robot

*** Variables ***
${URL_COMUNIDADE}    https://muda.cambiatus.io/community/about

*** Test Cases ***
Visualizar Comunidade
    [Tags]    regressivo    funcional    critico    smoke
    Abrir Página Comunidade    ${URL_COMUNIDADE}
    Verificar Componentes Comunidade

Compartilhar comunidade
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Página Comunidade    ${URL_COMUNIDADE}
    Acionar Botão              Compartilhar
    Verificar Tela Compartilhamento
    Verificar Botões Compartilhamento Nativos

Ganhe Muda
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Página Comunidade    ${URL_COMUNIDADE}
    Acionar Botão              Ganhe Muda
    Verificar Redirecionamento Ganhe Muda

Acessar "Nos Apoie"
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Página Comunidade    ${URL_COMUNIDADE}
    Acionar Botão              Nos apoie
    Verificar Redirecionamento Apoio Comunidade
