Funcionalidade: ofertas

@regressivo @funcional @critico @smoke
Cenário: Visualizar ofertas e comprar com saldo em mudas
    Dado que acesso https://muda.cambiatus.io/shop
    Quando aciono uma das ofertas disponíveis (https://muda.cambiatus.io/shop/257)
    E visualizo os detalhes da oferta  (https://muda.cambiatus.io/shop/257)
    E seleciono a "quantidade" desejada
    E clico em "Comprar"
    E insiro o "pin"
    E recebo o feedback "compra bem sucedida"
    Então o valor referente é descontato do saldo em mudas

@regressivo @funcional @critico
Cenário: Comprar com saldo insuficiente
    Dado que acesso https://muda.cambiatus.io/shop
    Quando aciono uma das ofertas disponíveis (https://muda.cambiatus.io/shop/257)
    E visualizo os detalhes da oferta  (https://muda.cambiatus.io/shop/257)
    E seleciono a "quantidade" 20 unidades
    E aciono o botão "comprar"
    Então recebo o alert "Você não possui MUDA o suficiente para esta compra. Tente diminuir a quantidade de itens ou complete ações para ganhar mais MUDA."


@regressivo @funcional @critico
Cenário: Tentar adquirir oferta indisponível
    Dado que acesso a oferta https://muda.cambiatus.io/shop/2155
    E tento adquirir a oferta
    Então o no lugar do botão "comprar" é exibido o botão "esgotado" desabilitado

@regressivo @funcional @nao-bloqueante
Cenário: Usar filtros para exibir "minhas ofertas"
    Dado que acesso a tela de ofertas https://muda.cambiatus.io/shop
    E aciono o botão "filtro"
    E seleciono a opção "minhas ofertas"
    Então visualizo somente as ofertas que eu publiquei

@regressivo @funcional @nao-bloqueante
Cenário: Usar filtros para exibir ofertas de categorias
    Dado que acesso a tela de ofertas https://muda.cambiatus.io/shop
    E aciono o botão "filtro"
    E aciono "Todas as ofertas"
    E seleciono a opção "localidade"
    E seleciono a localidade "Rio de Janeiro"
    Então visualizo somente as ofertas de Rio de Janeiro

@regressivo @funcional @nao-bloqueante
Cenário: Usar filtros para exibir ofertas de categorias - 2 localidades
    Dado que acesso a tela de ofertas https://muda.cambiatus.io/shop
    E aciono o botão "filtro"
    E aciono "Todas as ofertas"
    E seleciono a opção "localidade"
    E seleciono a localidade "Rio de Janeiro"
    E seleciono a localidade "Virtual"
    Então visualizo somente as ofertas de Rio de Janeiro e Virtual

@regressivo @funcional @nao-bloqueante
Cenário: Remover filtro "pai" sem desmarcar filtros "filhos"
    Dado que acesso a tela de ofertas https://muda.cambiatus.io/shop
    E aciono o botão "filtro"
    E aciono "Todas as ofertas"
    E seleciono a opção "localidade"
    E seleciono a localidade "Rio de Janeiro"
    E seleciono a localidade "Virtual"
    E removo o filtro "localidade"
    Então todas as ofertas que usam a categoria "localidade" devem ser ocultadas


@regressivo @funcional @nao-bloqueante
Cenário: Remover filtros aplicados
    Dado que acesso a tela de ofertas https://muda.cambiatus.io/shop
    E aciono o botão "filtro"
    E aciono "Todas as ofertas"
    E seleciono a opção "localidade"
    E seleciono a localidade "Rio de Janeiro"
    E seleciono a localidade "Virtual"
    E removo todos os filtros aplicados
    Então todas as ofertas devem ser exibidas