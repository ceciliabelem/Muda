*** Settings ***
Documentation     Testes automatizados para Diretrizes
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
Resource        resources/massas.robot

*** Test Cases ***
Visualizar Diretrizes
    [Tags]    regressivo    funcional    critico    smoke
    # Dado que acesso a tela de diretrizes
    # Então visualizo o conteúdo das diretrizes e opções de aceite/recusa
    Abrir Tela Diretrizes
    Verificar Conteúdo Diretrizes
    Verificar Opções Aceite Recusa

Aceitar Diretrizes
    [Tags]    regressivo    funcional    critico
    # Dado que acesso a tela de diretrizes
    # Quando aciono o botão "Aceito"
    # Então sou direcionado para o painel logado
    Abrir Tela Diretrizes
    Acionar Botão              Aceito
    Verificar Redirecionamento Painel Logado

Recusar Diretrizes
    [Tags]    regressivo    funcional    critico
    # Dado que acesso a tela de diretrizes
    # Quando aciono o botão "Não aceito"
    # Então sou direcionado para a home congelada
    Abrir Tela Diretrizes
    Acionar Botão              Não aceito
    Verificar Redirecionamento Home Congelada
