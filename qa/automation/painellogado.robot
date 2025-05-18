*** Settings ***
Documentation     Testes automatizados para Painel Logado
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
Resource        resources/massas.robot

*** Variables ***
${URL_LOGIN}    https://muda.cambiatus.io/

*** Test Cases ***
Visualizar e fechar modal "Apoie sua comunidade"
    [Tags]    regressivo    funcional    nao-bloqueante    smoke
    # Dado que acesso a página de login (${URL_LOGIN})
    # Quando aciono o botão "Já sou membro"
    # E insiro as 12 palavras chave
    # Ou aciono o botão "Colar" as 12 palavras chave
    # E clico em "Continuar"
    # E insiro e confirmo o "Pin"
    # E sou direcionada para o painel logado
    # E visualizo a modal "Apoie sua comunidade"
    # E aciono o botão "Fechar"
    # Então a modal é fechada
    Abrir Página de Login      ${URL_LOGIN}
    Acionar Botão              Já sou membro
    Inserir Palavras Chave    ${PALAVRAS_CHAVE_TESTE}
    Clicar em Continuar
    Inserir e Confirmar Pin   ${PIN_TESTE}
    Verificar Redirecionamento Painel Logado
    Verificar Modal Aberta     Apoie sua comunidade
    Acionar Botão              Fechar
    Verificar Modal Fechada    Apoie sua comunidade

Visualizar e apoiar a comunidade
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que acesso a página de login (${URL_LOGIN})
    # Quando aciono o botão "Já sou membro"
    # E insiro as 12 palavras chave
    # Ou aciono o botão "Colar" as 12 palavras chave
    # E clico em "Continuar"
    # E insiro e confirmo o "Pin"
    # E sou direcionada para o painel logado
    # E visualizo a modal "Apoie sua comunidade"
    # E aciono o botão "Apoiar Muda"
    # Então sou direcionada para a tela de apoiar a comunidade
    Abrir Página de Login      ${URL_LOGIN}
    Acionar Botão              Já sou membro
    Inserir Palavras Chave    ${PALAVRAS_CHAVE_TESTE}
    Clicar em Continuar
    Inserir e Confirmar Pin   ${PIN_TESTE}
    Verificar Redirecionamento Painel Logado
    Verificar Modal Aberta     Apoie sua comunidade
    Acionar Botão              Apoiar Muda
    Verificar Redirecionamento Apoio Comunidade
