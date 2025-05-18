*** Settings ***
Documentation     Testes automatizados para Seleção de idiomas na home deslogada
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
Resource        resources/massas.robot

*** Variables ***
${URL_HOME}    https://muda.cambiatus.io/

*** Test Cases ***
Seleção de idioma "Pt-BR" na home deslogada
    [Tags]    regressivo    funcional    nao-bloqueante    smoke
    # Dado que acesso a página inicial (${URL_HOME})
    # Quando aciono o botão "Linguagens"
    # E seleciono o idioma "Português (Brasil)"
    # Então a página é traduzida para o idioma "Português (Brasil)"
    Abrir Página Inicial      ${URL_HOME}
    Acionar Botão             Linguagens
    Selecionar Idioma         Português (Brasil)
    Verificar Página Traduzida Português (Brasil)

Seleção de idioma "En-US" na home deslogada
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Página Inicial      ${URL_HOME}
    Acionar Botão             Linguagens
    Selecionar Idioma         En-US
    Verificar Página Traduzida Inglês (Estados Unidos)

Seleção de idioma "AMH" na home deslogada
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Página Inicial      ${URL_HOME}
    Acionar Botão             Linguagens
    Selecionar Idioma         AMH
    Verificar Página Traduzida Amárico

Seleção de idioma "CAT" na home deslogada
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Página Inicial      ${URL_HOME}
    Acionar Botão             Linguagens
    Selecionar Idioma         CAT
    Verificar Página Traduzida Catalão

Seleção de idioma "ES" na home deslogada
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Página Inicial      ${URL_HOME}
    Acionar Botão             Linguagens
    Selecionar Idioma         ES
    Verificar Página Traduzida Espanhol
