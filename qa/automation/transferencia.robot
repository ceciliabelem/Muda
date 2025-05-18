*** Settings ***
Documentation     Testes automatizados para Transferência
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
# Resource        ../resources/common_keywords.robot
Resource        resources/massas.robot

*** Variables ***
${URL_PAINEL_LOGADO}    https://muda.cambiatus.io/dashboard

*** Test Cases ***
Acessar a tela de transferência
    [Tags]    regressivo    funcional    critico    smoke
    # Dado que acesso o painel logado (${URL_PAINEL_LOGADO})
    # E aciono o botão "Transferir"
    # Então visualizo a tela de transferência e os campos necessários
    Abrir Painel Logado         ${URL_PAINEL_LOGADO}
    Acionar Botão               Transferir
    Verificar Tela Transferência
    Verificar Campos Transferência

Buscar usuário
    [Tags]    regressivo    funcional    critico
    Abrir Painel Logado         ${URL_PAINEL_LOGADO}
    Acionar Botão               Transferir
    Preencher Nome de Usuário   Cíntia
    Verificar Lista Usuários    Cíntia

Inserir 2o nome de usuário após busca do primeiro
    [Tags]    regressivo    funcional    critico
    Abrir Painel Logado         ${URL_PAINEL_LOGADO}
    Acionar Botão               Transferir
    Preencher Nome de Usuário   Cíntia
    Preencher Nome de Usuário   Ivanilson
    Verificar Nome de Usuário Alterado   Ivanilson

Excluir nome de usuário
    [Tags]    regressivo    funcional    critico
    Abrir Painel Logado         ${URL_PAINEL_LOGADO}
    Acionar Botão               Transferir
    Preencher Nome de Usuário   Cíntia
    Acionar Botão               excluir
    Verificar Nome de Usuário Excluído

Efetuar transação sem saldo
    [Tags]    regressivo    funcional    critico
    Abrir Painel Logado         ${URL_PAINEL_LOGADO}
    Acionar Botão               Transferir
    Preencher Nome de Usuário   Cíntia
    Preencher Valor Transferência   1000
    Verificar Mensagem          Você não tem MUDA o suficiente para transferir esta quantia. Você pode transferir até 266 MUDA

Efetuar transação com saldo
    [Tags]    regressivo    funcional    critico    smoke
    Abrir Painel Logado         ${URL_PAINEL_LOGADO}
    Acionar Botão               Transferir
    Preencher Nome de Usuário   válido
    Preencher Valor Transferência   valor_disponível
    Acionar Botão               Transferir
    Verificar Transferência Realizada
