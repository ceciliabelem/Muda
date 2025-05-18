*** Settings ***
Documentation     Testes automatizados para Objetivos
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
# Resource        ../resources/common_keywords.robot

*** Test Cases ***
Acessar tela de objetivos
    [Tags]    regressivo    funcional    critico    smoke
    # Dado que estou na tela Home Logada
    # Quando eu aciono o botão "Objetivos"
    # Então eu devo ver a tela de objetivos
    # E os seguintes componentes: Título, Botão, Bloco, Accordions, Cards, etc.
    Abrir Home Logada
    Acionar Botão              Objetivos
    Verificar Tela Objetivos
    Verificar Componentes Tela Objetivos
    Verificar Accordions e Cards Objetivos
