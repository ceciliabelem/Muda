*** Settings ***
Documentation     Testes automatizados para Criar Oferta
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
Resource        resources/massas.robot

*** Variables ***
${URL_NOVA_OFERTA}    https://muda.cambiatus.io/shop/new/sell?step=mainInformation

*** Test Cases ***
Criar uma nova oferta com sucesso - Passo 1 de 4
    [Tags]    regressivo    funcional    critico    smoke
    Abrir Página Nova Oferta   ${URL_NOVA_OFERTA}
    Verificar Campos Passo 1
    Preencher Nome Produto     Aulas de Programação
    Preencher Descrição Produto    Descrição das aulas de programação
    Formatar Texto Descrição
    Acionar Botão              Continuar
    Verificar Redirecionamento Passo 2

Criar uma nova oferta com sucesso - Passo 2 de 4
    [Tags]    regressivo    funcional    critico    smoke
    Abrir Página Nova Oferta Passo 2
    Verificar Campos Passo 2
    Acionar Botão              Adicionar imagem
    Selecionar Imagem Produto  imagem.png
    Acionar Botão              Continuar
    Verificar Redirecionamento Passo 3

Criar uma nova oferta com sucesso - Passo 3 de 4
    [Tags]    regressivo    funcional    critico    smoke
    Abrir Página Nova Oferta Passo 3
    Verificar Campos Passo 3
    Selecionar Categoria Produto
    Selecionar Localidade
    Acionar Botão              Continuar
    Verificar Redirecionamento Passo 4
