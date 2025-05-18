*** Settings ***
Documentation     Testes automatizados para Notificações
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
Resource        resources/massas.robot

*** Test Cases ***
Visualizar notificações
    [Tags]    regressivo    funcional    critico    smoke
    # Dado que o usuário está logado no sistema
    # Quando o usuário acessa a página de "Notificações"
    # Então o usuário deve ver uma lista de notificações de transações recentes em ordem decrescente
    # E visualizo: Título, Data, Valor em Muda, Tipo transação
    Logar no Sistema
    Acessar Página Notificações
    Verificar Lista Notificações Ordem Decrescente
    Verificar Componentes Notificação

Visualizar detalhes da notificação
    [Tags]    regressivo    funcional    critico
    # Dado que o usuário está logado no sistema
    # E o usuário acessa a página de "Notificações"
    # Quando o usuário clica em uma notificação específica
    # Então o usuário deve ver os detalhes da notificação selecionada
    Logar no Sistema
    Acessar Página Notificações
    Selecionar Notificação Específica
    Verificar Detalhes Notificação
    Verificar Componentes Detalhes Notificação

Ver a transação no explorador de blocos
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que o usuário está logado no sistema
    # E visualiza uma notificação
    # Quando aciona o botão "Ver no explorador de blocos"
    # Então o usuário deve ser redirecionado para a página do explorador de blocos (https://local.bloks.io/)
    Logar no Sistema
    Visualizar Notificação
    Acionar Botão              Ver no explorador de blocos
    Verificar Redirecionamento Explorador de Blocos

Ver o saldo do usuário
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que o usuário está logado no sistema
    # E visualiza uma notificação
    # Quando aciona o botão "Meu Saldo"
    # Então o usuário deve ser redirecionado para a home logada
    Logar no Sistema
    Visualizar Notificação
    Acionar Botão              Meu Saldo
    Verificar Redirecionamento Home Logada
