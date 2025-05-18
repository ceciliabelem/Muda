*** Settings ***
Documentation     Testes automatizados para Configurações
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
Resource        resources/massas.robot

*** Test Cases ***
Configurações
    [Tags]    regressivo    funcional    critico    smoke
    # Dado que estou na tela Home Logada
    # Quando eu aciono o botão "Minha Conta"
    # E aciono o botão "Configurações"
    # Então eu devo ver a tela de configurações e os seguintes componentes: Configurações da Conta, Notificações por e-mail, etc.
    Abrir Home Logada
    Acionar Botão              Minha Conta
    Acionar Botão              Configurações
    Verificar Tela Configurações
    Verificar Componentes Configurações

Baixar palavra passe
    [Tags]    regressivo    funcional    critico
    # Dado que estou na tela de configurações
    # E aciono o botão "Baixar palavra passe"
    # Então deve iniciar o download do PDF contendo as palavras-passe
    Abrir Tela Configurações
    Acionar Botão              Baixar palavra passe
    Verificar Download PDF Palavras Passe

Exportar chave privada
    [Tags]    regressivo    funcional    critico
    # Dado que estou na tela de configurações
    # E aciono o botão "Exportar"
    # E abre a modal "Exportar chave privada"
    # Então visualizo os componentes da modal
    Abrir Tela Configurações
    Acionar Botão              Exportar
    Verificar Modal Aberta     Exportar chave privada
    Verificar Componentes Modal Chave Privada

Trocar PIN
    [Tags]    regressivo    funcional    critico
    # Dado que estou na tela de configurações
    # E aciono o botão "Trocar"
    # E abre a modal "Trocar PIN"
    # Então visualizo os componentes da modal
    Abrir Tela Configurações
    Acionar Botão              Trocar
    Verificar Modal Aberta     Trocar PIN
    Verificar Componentes Modal Trocar PIN
