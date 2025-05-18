*** Settings ***
Documentation     Testes automatizados para Filtro de Transferências
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
Resource        resources/massas.robot

*** Variables ***
${URL_PAINEL_LOGADO}    https://muda.cambiatus.io/dashboard

*** Test Cases ***
Filtro de transferências
    [Tags]    regressivo    funcional    nao-bloqueante    smoke
    Abrir Painel Logado         ${URL_PAINEL_LOGADO}
    Acionar Botão               Filtros
    Verificar Modal Filtros Carregada

Filtro de transferências por data com transação
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Painel Logado         ${URL_PAINEL_LOGADO}
    Acionar Botão               Filtros
    Selecionar Opção Filtro     Data    25/02/2025
    Acionar Botão               Aplicar
    Verificar Transferências Listadas Data    25/02/2025

Filtro de transferências por data sem transação
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Painel Logado         ${URL_PAINEL_LOGADO}
    Acionar Botão               Filtros
    Selecionar Opção Filtro     Data    26/02/2025
    Acionar Botão               Aplicar
    Verificar Mensagem          Nenhuma transferência.

Exclusão de filtro de data na modal de filtros
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Painel Logado         ${URL_PAINEL_LOGADO}
    Acionar Botão               Filtros
    Selecionar Opção Filtro     Data    25/02/2025
    Acionar Botão               Limpar
    Acionar Botão               Aplicar
    Verificar Lista Transferências Sem Filtro

Selecionar direção da transferência - Entrada
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Painel Logado         ${URL_PAINEL_LOGADO}
    Acionar Botão               Filtros
    Selecionar Opção Filtro     Direção    Entrada
    Acionar Botão               Aplicar
    Verificar Transferências Listadas Direção    Entrada

Selecionar direção da transferência - Saída
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Painel Logado         ${URL_PAINEL_LOGADO}
    Acionar Botão               Filtros
    Selecionar Opção Filtro     Direção    Saída
    Acionar Botão               Aplicar
    Verificar Transferências Listadas Direção    Saída

Selecionar direção da transferência - Ambas
    [Tags]    regressivo    funcional    nao-bloqueante
    Abrir Painel Logado         ${URL_PAINEL_LOGADO}
    Acionar Botão               Filtros
    Selecionar Opção Filtro     Direção    Ambas
    Acionar Botão               Aplicar
    Verificar Transferências Listadas Direção    Ambas
