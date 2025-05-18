*** Settings ***
Documentation     Testes automatizados para Seleção de idiomas na home logada
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
Resource        resources/massas.robot

*** Variables ***
${URL_HOME}    https://muda.cambiatus.io/

*** Test Cases ***
Seleção de idioma "Pt-BR" na home logada
    [Tags]    regressivo    funcional    nao-bloqueante    smoke
    Abrir Página Inicial      ${URL_HOME}
    Inserir Palavras Chave    ${PALAVRAS_CHAVE_TESTE}
    Clicar em Continuar
    Inserir e Confirmar Pin   ${PIN_TESTE}
    Verificar Redirecionamento Painel Logado
    Acionar Botão             Minha Conta
    Acionar Botão             Linguagens
    Selecionar Idioma         PT-BR
    Verificar Página Traduzida Português (Brasil)

Seleção de idioma "En-US" na home logada
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Página Inicial      ${URL_HOME}
    Inserir Palavras Chave    ${PALAVRAS_CHAVE_TESTE}
    Clicar em Continuar
    Inserir e Confirmar Pin   ${PIN_TESTE}
    Verificar Redirecionamento Painel Logado
    Acionar Botão             Minha Conta
    Acionar Botão             Linguagens
    Selecionar Idioma         En-US
    Verificar Página Traduzida Inglês (Estados Unidos)

Seleção de idioma "AMH" na home logada
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Página Inicial      ${URL_HOME}
    Inserir Palavras Chave    ${PALAVRAS_CHAVE_TESTE}
    Clicar em Continuar
    Inserir e Confirmar Pin   ${PIN_TESTE}
    Verificar Redirecionamento Painel Logado
    Acionar Botão             Minha Conta
    Acionar Botão             Linguagens
    Selecionar Idioma         AMH
    Verificar Página Traduzida Amárico

Seleção de idioma "CAT" na home logada
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Página Inicial      ${URL_HOME}
    Inserir Palavras Chave    ${PALAVRAS_CHAVE_TESTE}
    Clicar em Continuar
    Inserir e Confirmar Pin   ${PIN_TESTE}
    Verificar Redirecionamento Painel Logado
    Acionar Botão             Minha Conta
    Acionar Botão             Linguagens
    Selecionar Idioma         CAT
    Verificar Página Traduzida Catalão
