*** Settings ***
Documentation     Testes automatizados para Painel - Header
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
Resource        resources/massas.robot

*** Test Cases ***
Alterar comunidade
    [Tags]    regressivo    funcional    nao-bloqueante    smoke
    # Dado que aciono o logo "Muda Outras Economias"
    # E a modal "Alterar comunidade" é exibida
    # Então visualizo: Título, Botão Fechar, Texto, Botão "Muda Outras Economias"
    Acionar Logo                Muda Outras Economias
    Verificar Modal Aberta      Alterar comunidade
    Verificar Componentes Modal Alterar comunidade
