*** Settings ***
Documentation     Testes automatizados para Convite (modal)
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
# Resource        ../resources/common_keywords.robot

*** Test Cases ***
Convidar amigo
    [Tags]    regressivo    funcional    critico
    # Dado que o usuário está logado no sistema
    # E o usuário aciona o botão "Convide seus amigos"
    # Então o usuário deve ver uma modal com os componentes: Título "Convide um amigo", Botão "Fechar", Texto "Envie essa URL para seus amigos", Link de convite, Botão "Copiar"
    Logar no Sistema
    Acionar Botão              Convide seus amigos
    Verificar Modal Aberta     Convide um amigo
    Verificar Componentes Modal Convite
