*** Settings ***
Documentation     Testes automatizados para Doação - Patrocínio
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
# Resource        ../resources/common_keywords.robot
Resource        resources/massas.robot

*** Test Cases ***
Visualizar a tela Patrocínio
    [Tags]    regressivo    funcional    critico    smoke
    # Dado que acesso a página de "Patrocínio"
    # Então visualizo a página com os componentes: Botão Voltar, Título, Caixa de edição, Seleção de moeda, Botões PayPal, etc.
    Abrir Página Patrocínio
    Verificar Componentes Tela Patrocínio

Valor negativo em diferentes moedas
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que acesso a página de "Patrocínio"
    # Quando insiro o valor "<valor>"
    # E seleciono a moeda "<moeda>"
    # Então visualizo o valor não é inserido na caixa de texto
    Abrir Página Patrocínio
    Inserir Valor Patrocínio  -1    BRL
    Verificar Valor Não Inserido
    Inserir Valor Patrocínio  -1    USD
    Verificar Valor Não Inserido

Valor 0 em diferentes moedas
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que acesso a página de "Patrocínio"
    # Quando insiro o valor "0"
    # E seleciono a moeda
    # Então visualizo o feedback "Insira um valor válido"
    Abrir Página Patrocínio
    Inserir Valor Patrocínio  0    BRL
    Verificar Feedback        Insira um valor válido
    Inserir Valor Patrocínio  0    USD
    Verificar Feedback        Insira um valor válido

Inserção de valor acima do máximo permitido
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que acesso a página de "Patrocínio"
    # Quando insiro o valor "999.000.000.000.000.000,00"
    # E insiro mais um dígito
    # (MELHORIA: Feedback para o usuário sobre valor máximo)
    # (BUG: Com valor máximo não é possível acessar a tela de pagamento do PayPal)
    Abrir Página Patrocínio
    Inserir Valor Patrocínio  999.000.000.000.000.000,00
    Inserir Mais Um Dígito
    Verificar Feedback Valor Máximo
