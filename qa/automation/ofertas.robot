*** Settings ***
Documentation     Testes automatizados para Ofertas
Suite Setup       # (Opcional) Setup comum
Suite Teardown    # (Opcional) Teardown comum
# Resource        ../resources/common_keywords.robot
Resource        resources/massas.robot

*** Variables ***
${URL_OFERTAS}    https://muda.cambiatus.io/shop
${URL_OFERTA_EXEMPLO}    https://muda.cambiatus.io/shop/257
${URL_OFERTA_INDISPONIVEL}    https://muda.cambiatus.io/shop/2155

*** Test Cases ***
Visualizar ofertas e comprar com saldo em mudas
    [Tags]    regressivo    funcional    critico    smoke
    # Dado que acesso ${URL_OFERTAS}
    # Quando aciono uma das ofertas disponíveis (${URL_OFERTA_EXEMPLO})
    # E visualizo os detalhes da oferta
    # E seleciono a "quantidade" desejada
    # E clico em "Comprar"
    # E insiro o "pin"
    # E recebo o feedback "compra bem sucedida"
    # Então o valor referente é descontato do saldo em mudas
    Abrir Página Ofertas      ${URL_OFERTAS}
    Selecionar Oferta         ${URL_OFERTA_EXEMPLO}
    Visualizar Detalhes Oferta
    Selecionar Quantidade     desejada
    Acionar Botão             Comprar
    Inserir Pin   ${PIN_TESTE}
    Verificar Feedback        compra bem sucedida
    Verificar Desconto Saldo

Comprar com saldo insuficiente
    [Tags]    regressivo    funcional    critico
    # Dado que acesso ${URL_OFERTAS}
    # Quando aciono uma das ofertas disponíveis (${URL_OFERTA_EXEMPLO})
    # E visualizo os detalhes da oferta
    # E seleciono a "quantidade" 20 unidades
    # E aciono o botão "comprar"
    # Então recebo o alert "Você não possui MUDA o suficiente para esta compra. ..."
    Abrir Página Ofertas      ${URL_OFERTAS}
    Selecionar Oferta         ${URL_OFERTA_EXEMPLO}
    Visualizar Detalhes Oferta
    Selecionar Quantidade     20
    Acionar Botão             Comprar
    Verificar Alerta          Você não possui MUDA o suficiente para esta compra. Tente diminuir a quantidade de itens ou complete ações para ganhar mais MUDA.

Tentar adquirir oferta indisponível
    [Tags]    regressivo    funcional    critico
    # Dado que acesso a oferta ${URL_OFERTA_INDISPONIVEL}
    # E tento adquirir a oferta
    # Então no lugar do botão "comprar" é exibido o botão "esgotado" desabilitado
    Abrir Oferta Indisponível ${URL_OFERTA_INDISPONIVEL}
    Tentar Adquirir Oferta
    Verificar Botão Esgotado Desabilitado

Usar filtros para exibir "minhas ofertas"
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que acesso a tela de ofertas ${URL_OFERTAS}
    # E aciono o botão "filtro"
    # E seleciono a opção "minhas ofertas"
    # Então visualizo somente as ofertas que eu publiquei
    Abrir Página Ofertas      ${URL_OFERTAS}
    Acionar Botão             filtro
    Selecionar Opção Filtro   minhas ofertas
    Verificar Ofertas Publicadas

Usar filtros para exibir ofertas de categorias
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que acesso a tela de ofertas ${URL_OFERTAS}
    # E aciono o botão "filtro"
    # E aciono "Todas as ofertas"
    # E seleciono a opção "localidade"
    # E seleciono a localidade "Rio de Janeiro"
    # Então visualizo somente as ofertas de Rio de Janeiro
    Abrir Página Ofertas      ${URL_OFERTAS}
    Acionar Botão             filtro
    Acionar Botão             Todas as ofertas
    Selecionar Opção Filtro   localidade
    Selecionar Localidade     Rio de Janeiro
    Verificar Ofertas Localidade Rio de Janeiro

Usar filtros para exibir ofertas de categorias - 2 localidades
    [Tags]    regressivo    funcional    nao-bloqueante
    # Dado que acesso a tela de ofertas ${URL_OFERTAS}
    # E aciono o botão "filtro"
    # E aciono "Todas as ofertas"
    # (continuação: selecionar mais de uma localidade e verificar resultado)
    Abrir Página Ofertas      ${URL_OFERTAS}
    Acionar Botão             filtro
    Acionar Botão             Todas as ofertas
    Selecionar Opção Filtro   localidade
    Selecionar Localidades    múltiplas
    Verificar Ofertas Multiplas Localidades
