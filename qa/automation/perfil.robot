*** Settings ***
Documentation     Testes automatizados para Perfil
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
# Resource        ../resources/common_keywords.robot
Resource        resources/massas.robot

*** Variables ***
${URL_LOGIN}    https://muda.cambiatus.io/

*** Test Cases ***
Visualizar Perfil
    [Tags]    regressivo    funcional    critico    smoke
    # Dado que acesso a página de login (${URL_LOGIN})
    # E aciono o botão "Já sou membro"
    # E insiro as 12 palavras chave
    # E aciono o botão "Continuar"
    # E insiro e confirmo o "Pin"
    # E sou direcionada para o painel logado
    # E aciono o botão "Minha Conta"
    # Então visualizo o perfil com os componentes: Botão Voltar, Foto de perfil, Nome completo, Email, nome de usuário, Editar perfil, Ver no explorador de blocos, Localização, Interesses, Opções de contato, Saldo Total, Número de transferências, Número de reivindicações, Itens na loja, Membro desde, Última transação, Últimas transferências
    Abrir Página de Login      ${URL_LOGIN}
    Acionar Botão              Já sou membro
    Inserir Palavras Chave    ${PALAVRAS_CHAVE_TESTE}
    Acionar Botão              Continuar
    Inserir e Confirmar Pin   ${PIN_TESTE}
    Verificar Redirecionamento Painel Logado
    Acionar Botão              Minha Conta
    Verificar Componentes Perfil

Editar Perfil com dados válidos
    [Tags]    regressivo    funcional    critico
    # Dado que acesso a página de "perfil"
    # E aciono o botão "Editar perfil"
    # E insiro um novo "Nome completo"
    # E insiro um novo "e-mail"
    # E preencho a "biografia"
    # E insiro uma nova "localização"
    # E seleciono os "interesses"
    # E aciono o botão "Salvar"
    # Então visualizo a mensagem "Perfil salvo com sucesso"
    Abrir Página Perfil
    Acionar Botão              Editar perfil
    Preencher Nome Completo    novo_nome
    Preencher Email            novo_email
    Preencher Biografia        nova_bio
    Preencher Localização      nova_localizacao
    Selecionar Interesses      novos_interesses
    Acionar Botão              Salvar
    Verificar Mensagem         Perfil salvo com sucesso

Editar Perfil com dados inválidos
    [Tags]    regressivo    funcional    critico
    # Dado que acesso a página de "perfil"
    # E aciono o botão "Editar perfil"
    # E insiro um novo "Nome completo"
    # E insiro um novo "e-mail" inválido
    Abrir Página Perfil
    Acionar Botão              Editar perfil
    Preencher Nome Completo    novo_nome
    Preencher Email            email_invalido
    Acionar Botão              Salvar
    Verificar Alerta           Email inválido
