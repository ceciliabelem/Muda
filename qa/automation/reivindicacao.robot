*** Settings ***
Documentation     Testes automatizados para Reivindicação de Muda
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
Resource        resources/massas.robot

*** Test Cases ***
Reivindicar Muda
    [Tags]    regressivo    funcional    critico    smoke
    # Dado que o usuário está logado no sistema
    # E o usuário acessa a página de "Minhas Reivindicações"
    # Então sou direcionada para a tela "Minhas Reivindicações"
    # E visualizo: Botão Voltar, Título, Card Lembre-se, Lista, Abas, etc.
    Logar no Sistema
    Acessar Página Minhas Reivindicações
    Verificar Redirecionamento Minhas Reivindicações
    Verificar Componentes Minhas Reivindicações

Visualizar modal de "Filtros"
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que o usuário está logado no sistema
    # E o usuário acessa a página de "Minhas Reivindicações"
    # E a aba "Esperando voto" ou "Analisadas" já está aberta
    # Quando o usuário clica no botão "Filtros"
    # Então o usuário deve ver uma modal com os componentes: Título, Botão Fechar, Texto, Caixa de seleção, Botão Aplicar
    Logar no Sistema
    Acessar Página Minhas Reivindicações
    Selecionar Aba            Esperando voto
    Acionar Botão             Filtros
    Verificar Modal Aberta    Filtros
    Verificar Componentes Modal Filtros

Filtrar por "Todos"
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que o usuário está logado no sistema
    # E o usuário acessa a página de "Minhas Reivindicações"
    # E a aba "Esperando voto" ou "Analisadas" já está aberta
    # E o usuário clica no botão "Filtros"
    # E abre a modal "Filtros"
    # E seleciona a opção "Todos"
    # Quando o usuário clica no botão "Aplicar"
    # Então o usuário deve ver uma lista de ações com o estado "Todos" na aba "Esperando voto"
    # E visualiza os cards das reivindicações com os componentes: Botão de Usuário logado, Miniatura da imagem, Texto "Aberto x dias atrás"
    Logar no Sistema
    Acessar Página Minhas Reivindicações
    Selecionar Aba            Esperando voto
    Acionar Botão             Filtros
    Verificar Modal Aberta    Filtros
    Selecionar Opção Filtro   Todos
    Acionar Botão             Aplicar
    Verificar Lista Ações Estado Todos
    Verificar Componentes Card Reivindicação
