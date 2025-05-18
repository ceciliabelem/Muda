*** Settings ***
Documentation     Testes automatizados para Cadastro de usuário
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
Resource        resources/massas.robot

*** Variables ***
${URL_CONVITE}    https://muda.cambiatus.io/register/Pzz98P
${EMAIL_VALIDO}   massadetestesmuda@gmail.com

*** Test Cases ***
Cadastro de usuário com sucesso
    [Tags]    regressivo    funcional    critico    smoke
    # Dado que acesso a página de convite (${URL_CONVITE})
    # Quando aciono o botão "Sim, fazer parte"
    # E informo o "Nome Completo" como "Planta Teste"
    # E informo o nome de usuário com 12 caracteres
    # E informo o "E-mail" como "${EMAIL_VALIDO}"
    # E confirmo clico em "Continuar"
    # E copio as palavras chave
    # E colo na tela de inserção de palavras chave
    # E clico em "Continuar"
    # Então o usuário é cadastrado com sucesso
    Abrir Página de Convite    ${URL_CONVITE}
    Acionar Botão              Sim, fazer parte
    Preencher Nome Completo    Planta Teste
    Preencher Nome de Usuário  12_caracteres
    Preencher Email            ${EMAIL_TESTE}
    Clicar em Continuar
    Copiar Palavras Chave
    Colar Palavras Chave
    Clicar em Continuar
    Verificar Cadastro Sucesso

Cadastro de usuário com somente 1 nome
    [Tags]    regressivo    funcional    critico
    # Dado que acesso a página de convite (${URL_CONVITE})
    # Quando aciono o botão "Sim, fazer parte"
    # E informo o "Nome Completo" como "Planta"
    # E informo o nome de usuário com 12 caracteres
    # E informo o "E-mail" como "${EMAIL_VALIDO}"
    # E confirmo clico em "Continuar"
    # Então é exibido o alerta "Opa. Algo de errado aconteceu enquanto criavamos sua conta"
    Abrir Página de Convite    ${URL_CONVITE}
    Acionar Botão              Sim, fazer parte
    Preencher Nome Completo    Planta
    Preencher Nome de Usuário  12_caracteres
    Preencher Email            ${EMAIL_TESTE}
    Clicar em Continuar
    Capture Page Screenshot
    Log    Mensagens de erro na tela:
    ${erros}=    Get WebElements    css=.form-error, .form-error.form-error-on-dark-bg
    FOR    ${erro}    IN    @{erros}
        ${texto}=    Get Text    ${erro}
        Log    ${texto}
    END
    Verificar Componente Erro Presente
    Verificar Alerta           Opa. Algo de errado aconteceu enquanto criavamos sua conta

Cadastro de usuário com nome de usuário com menos de 12 caracteres
    [Tags]    regressivo    funcional    critico
    # Dado que acesso a página de convite (${URL_CONVITE})
    # Quando aciono o botão "Sim, fazer parte"
    # E informo o "Nome Completo" como "Planta Teste"
    # E informo o nome de usuário com 11 caracteres
    # E informo o "E-mail" como "${EMAIL_VALIDO}"
    # E confirmo clico em "Continuar"
    # Então é retornado o alerta na caixa de edição "nome de usuário" com a mensagem "O texto deve ter exatamente 12 caracteres"
    Abrir Página de Convite    ${URL_CONVITE}
    Acionar Botão              Sim, fazer parte
    Preencher Nome Completo    Planta Teste
    Preencher Nome de Usuário  11_caracteres
    Preencher Email            ${EMAIL_TESTE}
    Clicar em Continuar
    Capture Page Screenshot
    Log    Mensagens de erro na tela:
    ${erros}=    Get WebElements    css=.form-error, .form-error.form-error-on-dark-bg
    FOR    ${erro}    IN    @{erros}
        ${texto}=    Get Text    ${erro}
        Log    ${texto}
    END
    Verificar Componente Erro Presente
    Verificar Alerta Campo     nome de usuário    O texto deve ter exatamente 12 caracteres

Cadastro de usuário com e-mail inválido
    [Tags]    regressivo    funcional    critico
    # Dado que acesso a página de convite (${URL_CONVITE})
    # Quando aciono o botão "Sim, fazer parte"
    # E informo o "Nome Completo" como "Planta Teste"
    # E informo o nome de usuário com 12 caracteres
    # E informo o "E-mail" como "massadetestesmuda"
    # E confirmo clico em "Continuar"
    # Então é retornado o alerta na caixa de edição "E-mail" com a mensagem "Por favor, use um email válido."
    Abrir Página de Convite    ${URL_CONVITE}
    Acionar Botão              Sim, fazer parte
    Preencher Nome Completo    Planta Teste
    Preencher Nome de Usuário  12_caracteres
    Preencher Email            massadetestesmuda
    Clicar em Continuar
    Capture Page Screenshot
    Log    Mensagens de erro na tela:
    ${erros}=    Get WebElements    css=.form-error, .form-error.form-error-on-dark-bg
    FOR    ${erro}    IN    @{erros}
        ${texto}=    Get Text    ${erro}
        Log    ${texto}
    END
    Verificar Componente Erro Presente
    Verificar Alerta Campo     E-mail    Por favor, use um email válido.

Usuário recusa convite
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que acesso a página de convite (${URL_CONVITE})
    # Quando aciono o botão "Não, obrigado"
    # E abre a modal "Atenção"
    # E aciono o botão "Não, obrigado"
    # Então sou direcionado para a página inicial
    Abrir Página de Convite    ${URL_CONVITE}
    Acionar Botão              Não, obrigado
    Verificar Modal Aberta     Atenção
    Acionar Botão              Não, obrigado
    Verificar Redirecionamento Página Inicial

Usuário recusa convite e muda de ideia na modal "Atenção"
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que acesso a página de convite (${URL_CONVITE})
    # Quando aciono o botão "Não, obrigado"
    # E abre a modal "Atenção"
    # E aciono o botão "Sim, participar"
    # Então sou direcionado para a página de cadastro
    Abrir Página de Convite    ${URL_CONVITE}
    Acionar Botão              Não, obrigado
    Verificar Modal Aberta     Atenção
    Acionar Botão              Sim, participar
    Verificar Redirecionamento Página de Cadastro

Usuário já tem cadastro
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que acesso a página de convite (${URL_CONVITE})
    # Quando aciono o botão "Sim, fazer parte"
    # E aciono o botão "Login"
    # Então sou direcionado para a página de inserção de palavras-chave
    Abrir Página de Convite    ${URL_CONVITE}
    Acionar Botão              Sim, fazer parte
    Acionar Botão              Login
    Verificar Redirecionamento Página de Inserção de Palavras-chave
