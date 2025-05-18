*** Settings ***
Documentation     Testes automatizados para Conta Congelada
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
Resource        resources/massas.robot

*** Variables ***
${URL_LOGIN}    https://muda.cambiatus.io/

*** Test Cases ***
Visualizar painel home logada congelada
    [Tags]    regressivo    funcional    critico    smoke
    # Dado que acesso a página de login (${URL_LOGIN})
    # Quando aciono o botão "Já sou membro"
    # E insiro as 12 palavras chave
    # Ou aciono o botão "Colar" as 12 palavras chave
    # E clico em "Continuar"
    # E insiro e confirmo o "Pin"
    # E visualizo a modal "Diretrizes"
    # E aciono o botão "Não aceito"
    # Quando confirmo acionando o botão "Não aceito"
    # Então sou direcionada para a home congelada
    # E visualizo a home congelada com os componentes: Card "Conta congelada", Bloco "Transações", Bloco "Transferências"
    Abrir Página de Login      ${URL_LOGIN}
    Acionar Botão              Já sou membro
    Inserir Palavras Chave    ${PALAVRAS_CHAVE_TESTE}
    Clicar em Continuar
    Inserir e Confirmar Pin   ${PIN_TESTE}
    Verificar Modal Aberta     Diretrizes
    Acionar Botão              Não aceito
    Confirmar Não Aceito
    Verificar Redirecionamento Home Congelada
    Verificar Componentes Home Congelada

Visualizar página de ofertas com conta congelada
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que estou com a conta congelada
    # Quando acesso a página de ofertas
    # Então acima da lista de ofertas é exibido o card de "Conta congelada"
    Abrir Página de Ofertas Com Conta Congelada
    Verificar Card Conta Congelada Ofertas
