*** Settings ***
<<<<<<< HEAD
Documentation     Testes automatizados para Login
Suite Setup       # (Opcional) Setup comum
Suite Teardown    Fechar Navegador
Resource        resources/massas.robot
Resource        resources/keywords.robot

*** Variables ***
${URL_LOGIN}    https://muda.cambiatus.io/

*** Test Cases ***
Login com sucesso
    [Tags]    regressivo    funcional    critico    smoke
    # Dado que acesso a página de login (${URL_LOGIN})
    # Quando aciono o botão "Já sou membro"
    # E insiro as 12 palavras-chave
    # E clico em "Continuar"
    # E insiro e confirmo o "PIN"
    # Então sou direcionada para o painel logado
    Abrir Página de Login      ${URL_LOGIN}
    Acionar Botão              Já sou membro
    Inserir Palavras Chave     ${PALAVRAS_CHAVE_TESTE}
    Acionar Botao Continuar Palavras
    Inserir e Confirmar Pin    ${PIN_TESTE}
    Verificar Redirecionamento Painel Logado

Login com palavras chave inválidas
    [Tags]    regressivo    funcional    critico
    Abrir Página de Login      ${URL_LOGIN}
    Acionar Botão              Já sou membro
    Inserir Palavras Chave     ${PALAVRAS_CHAVE_INVALIDAS}
    Acionar Botao Continuar Palavras
    Capture Page Screenshot
    Log    Mensagens de erro na tela:
    ${erros}=    Get WebElements    css=.form-error, .form-error.form-error-on-dark-bg
    FOR    ${erro}    IN    @{erros}
        ${texto}=    Get Text    ${erro}
        Log    ${texto}
    END
    Verificar Componente Erro Presente

Login com menos de 12 palavras-chave
    [Tags]    regressivo    funcional    critico
    # Dado que acesso a página de login (${URL_LOGIN})
    # Quando aciono o botão "Já sou membro"
    # E insiro as 11 palavras-chave
    # E clico em "Continuar"
    # Então é exibido o alerta "Por favor, digite 12 palavras"
    Abrir Página de Login      ${URL_LOGIN}
    Acionar Botão              Já sou membro
    Inserir Palavras Chave     ${PALAVRAS_CHAVE_11}
    Acionar Botao Continuar Palavras
    Capture Page Screenshot
    Log    Mensagens de erro na tela:
    ${erros}=    Get WebElements    css=.form-error, .form-error.form-error-on-dark-bg
    FOR    ${erro}    IN    @{erros}
        ${texto}=    Get Text    ${erro}
        Log    ${texto}
    END
    Verificar Componente Erro Presente

Tentativa de login sem inserir palavras-chave
    [Tags]    regressivo    funcional    critico
    # Dado que acesso a página de login (${URL_LOGIN})
    # Quando aciono o botão "Já sou membro"
    # E clico em "Continuar"
    # Então é exibido o alerta "Por favor, digite 12 palavras"
    Abrir Página de Login      ${URL_LOGIN}
    Acionar Botão              Já sou membro
    Acionar Botao Continuar Palavras
    Capture Page Screenshot
    Log    Mensagens de erro na tela:
    ${erros}=    Get WebElements    css=.form-error, .form-error.form-error-on-dark-bg
    FOR    ${erro}    IN    @{erros}
        ${texto}=    Get Text    ${erro}
        Log    ${texto}
    END
    Verificar Componente Erro Presente

Tentativa de login com visualização do PIN inserido
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que acesso a página de login (${URL_LOGIN})
    # Quando aciono o botão "Já sou membro"
    # E insiro as 12 palavras-chave
    # E clico em "Continuar"
    # E insiro um PIN válido
    # E confirmo o PIN válido
    # E aciono o botão "Mostrar" o PIN inserido
    # Então o PIN é exibido
    Abrir Página de Login      ${URL_LOGIN}
    Acionar Botão              Já sou membro
    Inserir Palavras Chave     ${PALAVRAS_CHAVE_TESTE}
    Acionar Botão              Continuar
    Inserir Pin                ${PIN_TESTE}
    Confirmar Pin              ${PIN_TESTE}
    Acionar Botao Mostrar PIN Custom
    Verificar PIN Exibido

Tentativa de login com PIN inválido - 3 caracteres
    [Tags]    regressivo    funcional    critico
    # Dado que acesso a página de login (${URL_LOGIN})
    # Quando aciono o botão "Já sou membro"
    # E insiro as 12 palavras-chave
    # E clico em "Continuar"
    # E insiro um PIN com 3 caracteres
    # E confirmo o PIN com 3 caracteres
    # Então é exibido o alerta "O PIN deve ter 6 dígitos"
    Abrir Página de Login      ${URL_LOGIN}
    Acionar Botão              Já sou membro
    Inserir Palavras Chave     ${PALAVRAS_CHAVE_TESTE}
    Acionar Botão              Continuar
    Inserir Pin                ${PIN_INVALIDO}
    Confirmar Pin              ${PIN_INVALIDO}
    Acionar Botao Entrar PIN
    Capture Page Screenshot
    Log    Mensagens de erro na tela:
    ${erros}=    Get WebElements    css=.form-error, .form-error.form-error-on-dark-bg
    FOR    ${erro}    IN    @{erros}
        ${texto}=    Get Text    ${erro}
        Log    ${texto}
    END
    Verificar Componente Erro Presente

Tentativa de login com PIN divergente
    [Tags]    regressivo    funcional    critico
    # Dado que acesso a página de login (${URL_LOGIN})
    # Quando aciono o botão "Já sou membro"
    # E insiro as 12 palavras-chave
    # E clico em "Continuar"
    # E insiro um PIN válido
    # E confirmo o PIN com valor divergente
    # Então é exibido o alerta de PIN divergente
    Abrir Página de Login      ${URL_LOGIN}
    Acionar Botão              Já sou membro
    Inserir Palavras Chave     ${PALAVRAS_CHAVE_TESTE}
    Acionar Botão              Continuar
    Inserir Pin                147258
    Confirmar Pin              258147
    Acionar Botao Entrar PIN
    Capture Page Screenshot
    Log    Mensagens de erro na tela:
    ${erros}=    Get WebElements    css=.form-error, .form-error.form-error-on-dark-bg
    FOR    ${erro}    IN    @{erros}
        ${texto}=    Get Text    ${erro}
        Log    ${texto}
    END
    Verificar Componente Erro Presente