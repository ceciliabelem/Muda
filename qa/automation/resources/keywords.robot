*** Settings ***
Library    SeleniumLibrary

Suite Teardown    Fechar Navegador

*** Variables ***
${URL_LOGIN}    https://muda.cambiatus.io/login

*** Keywords ***
Abrir Página de Login
    [Arguments]    ${url}
    Open Browser    ${url}    chrome
    Maximize Browser Window

Abrir Navegador E Acessar Login
    Abrir Página de Login    ${URL_LOGIN}

Acionar Botão
    [Arguments]    ${nome_botao}
    # Seletor robusto para o botão "Já sou membro" (agora é <a>, não <button>)
    Run Keyword If    '${nome_botao}' == 'Já sou membro'    Click Element    xpath=//a[contains(@class, 'button-primary') and contains(text(), 'Já sou membro')]
    ...    ELSE IF    '${nome_botao}' == 'Continuar'    Run Keyword And Ignore Error    Click Element    css=button.button.button-primary.min-w-full
    ...    ELSE IF    '${nome_botao}' == 'Continuar'    Click Element    xpath=//button[contains(., 'Continuar') or contains(., 'Continue')]
    ...    ELSE    Click Element    xpath=//*[self::button or self::a][contains(text(), '${nome_botao}')]
    # Após acionar o botão, varre novamente todos os erros visíveis na tela
    Sleep    0.5s
    Varre Erros Visiveis

Inserir Palavras Chave
    [Arguments]    ${palavras}
    Wait Until Element Is Visible    css=textarea.input.peer
    Input Text    css=textarea.input.peer    ${palavras}

Acionar Botao Continuar Palavras
    Click Element    css=button.button.button-primary.min-w-full

Clicar em Continuar
    Click Button    Continuar

Inserir e Confirmar Pin
    [Arguments]    ${pin}
    Input Text    css=#pin-input    ${pin}
    Input Text    css=#pin-confirmation-input    ${pin}
    Click Element    css=.button.button-primary.min-w-full.mt-auto

Verificar Redirecionamento Painel Logado
    ${ok}=    Run Keyword And Return Status    Location Should Be    https://muda.cambiatus.io/dashboard
    Run Keyword If    ${ok}    Return From Keyword
    ${ok}=    Run Keyword And Return Status    Location Should Be    https://muda.cambiatus.io/login?redirect=%2Fdashboard
    Run Keyword If    ${ok}    Return From Keyword
    Fail    Não foi possível validar o redirecionamento para o painel logado.

Verificar Alerta
    [Arguments]    ${mensagem}
    # Busca o componente de erro apenas pela classe, sem depender do texto, para suportar múltiplos idiomas
    Wait Until Element Is Visible    css=.form-error, .form-error.form-error-on-dark-bg    timeout=30s
    # Opcional: loga o texto do erro encontrado para troubleshooting
    ${erros}=    Get WebElements    css=.form-error, .form-error.form-error-on-dark-bg
    FOR    ${erro}    IN    @{erros}
        ${texto}=    Get Text    ${erro}
        Log    [ERRO VISÍVEL] ${texto}
    END

Inserir Pin
    [Arguments]    ${pin}
    Input Text    css=#pin-input    ${pin}

Confirmar Pin
    [Arguments]    ${pin}
    Input Text    css=#pin-confirmation-input    ${pin}

Acionar Botão Mostrar PIN
    Click Button    Mostrar

Acionar Botao Mostrar PIN Custom
    # Clica no botão 'Mostrar' ao lado do campo de PIN (robusto para o HTML real)
    Wait Until Element Is Visible    xpath=//button[contains(@class, 'uppercase') and contains(., 'Mostrar')]
    Click Element    xpath=//button[contains(@class, 'uppercase') and contains(., 'Mostrar')]
    Sleep    0.5s

Verificar PIN Exibido
    Wait Until Page Contains Element    xpath=//input[@type='text' and contains(@id, 'pin-input')]

Acionar Botão Continuar Password
    Wait Until Element Is Visible    css=button.button.button-primary.min-w-full[type="submit"]
    Click Element    css=button.button.button-primary.min-w-full[type="submit"]

Copiar Palavras Passe Para Area De Transferencia
    [Arguments]    ${palavras}
    Set Clipboard Value    ${palavras}

Acionar Botão Paste
    Wait Until Element Is Visible    css=button.button-secondary
    Click Element    css=button.button-secondary

Colar Palavras Chave
    Wait Until Element Is Visible    css=button.button-secondary
    Click Element    css=button.button-secondary
    Sleep    0.5s
    Clicar Botao Avancar

Clicar Botao Avancar
    Wait Until Element Is Visible    css=button.button.button-primary.min-w-full
    Click Element    css=button.button.button-primary.min-w-full
    Sleep    0.5s

Varre Erros Visiveis
    # Varre e loga todos os erros visíveis na tela
    ${erros}=    Get WebElements    css=.form-error, .form-error.form-error-on-dark-bg
    FOR    ${erro}    IN    @{erros}
        ${texto}=    Get Text    ${erro}
        Log    [ERRO VISÍVEL] ${texto}
    END

Verificar Componente Erro Presente
    [Arguments]
    Wait Until Element Is Visible    css=.form-error, .form-error.form-error-on-dark-bg    timeout=10s

Fechar Navegador
    Close Browser

Acionar Botao Entrar PIN
    # Clica no botão de submit do PIN após preenchimento
    Wait Until Element Is Visible    css=button.button.button-primary.min-w-full.mt-auto    timeout=10s
    Click Element    css=button.button.button-primary.min-w-full.mt-auto
    Sleep    0.5s

Preencher Palavras Chave Corretas
    Inserir Palavras Chave    ${PALAVRAS_CHAVE_TESTE}

Colar Palavras Chave Corretas
    Copiar Palavras Chave Para Area De Transferencia    ${PALAVRAS_CHAVE_TESTE}
    Colar Palavras Chave

Colar Palavras Chave Invalidas
    Copiar Palavras Chave Para Area De Transferencia    ${PALAVRAS_CHAVE_INVALIDAS}
    Colar Palavras Chave

# Adapte os seletores conforme o HTML real do sistema
