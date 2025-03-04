<<<<<<< HEAD:qa/manuals/test_cases/TransferenciasFiltro.feature
Funcionalidade: Filtro de Transferências

@regressivo @funcional @nao-bloqueante @smoke
Cenário: Filtro de transferências
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    Então a modal de filtros é carregada

    Cenário: Filtro de transferências por data com transação
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E seleciono a opção "Data" que teve transferencia (25/02/2025)
    E aciono o botão "Aplicar"
    Então todas as transfeências que ocorreram na data devem ser listadas


    Cenário: Filtro de transferências por data sem transação
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E seleciono a opção "Data" que não teve transferencia (26/02/2025)
    E aciono o botão "Aplicar"
    Então é exibida a mensagem "Nenhuma transferência."

    Cenário: Exclusão de filtro de data na modal de filtros
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E seleciono a opção "Data" que teve transferencia (25/02/2025)
    E aciono o botão "Limpar"
    E aciono o botão "Aplicar"
    Então a lista de transferências deve ser exibida sem filtro

    Cenário: Selecionar direção da transferência - Entrada
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E seleciono a opção "Direção" "Entrada"
    E aciono o botão "Aplicar"
    Então todas as transferências de entrada devem ser listadas

    Cenário: Selecionar direção da transferência - Saída
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E seleciono a opção "Direção" "Saída"
    E aciono o botão "Aplicar"
    Então todas as transferências de saída devem ser listadas

    Cenário: Selecionar direção da transferência - Ambas
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E seleciono a opção "Direção" "Ambas"
    E aciono o botão "Aplicar"
    Então todas as transferências devem ser listadas

    Cenário: Seleção de usuário que enviou ou recebeu
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E insiro o "nome de usuário" - "Cíntia"
    E é exibida a lista de usuários que contém a palavra chave
    E seleciono o usuário "Cíntia Maria Belém"
    E aciono o botão "Aplicar"
    Então todas as transferências que envolveram o usuário devem ser listadas

@regressivo @funcional @nao-bloqueante
Cenário: Filtrar transferências por valor
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E seleciono a opção "Valor" com transferência acima de R$100,00
    E aciono o botão "Aplicar"
    Então todas as transferências acima do valor devem ser listadas

@regressivo @funcional @nao-bloqueante
Cenário: Filtrar transferências por usuário
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E insiro o "nome de usuário" - "João"
    E é exibida a lista de usuários que contém a palavra chave
    E seleciono o usuário "João da Silva"
    E aciono o botão "Aplicar"
    Então todas as transferências que envolveram o usuário devem ser listadas



=======
 Cenário: Filtro de transferências
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    Então a modal de filtros é carregada

    Cenário: Filtro de transferências por data com transação
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E seleciono a opção "Data" que teve transferencia (25/02/2025)
    E aciono o botão "Aplicar"
    Então todas as transfeências que ocorreram na data devem ser listadas


    Cenário: Filtro de transferências por data sem transação
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E seleciono a opção "Data" que não teve transferencia (26/02/2025)
    E aciono o botão "Aplicar"
    Então é exibida a mensagem "Nenhuma transferência."

    Cenário: Exclusão de filtro de data na modal de filtros
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E seleciono a opção "Data" que teve transferencia (25/02/2025)
    E aciono o botão "Limpar"
    E aciono o botão "Aplicar"
    Então a lista de transferências deve ser exibida sem filtro

    Cenário: Selecionar direção da transferência - Entrada
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E seleciono a opção "Direção" "Entrada"
    E aciono o botão "Aplicar"
    Então todas as transferências de entrada devem ser listadas

    Cenário: Selecionar direção da transferência - Saída
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E seleciono a opção "Direção" "Saída"
    E aciono o botão "Aplicar"
    Então todas as transferências de saída devem ser listadas

    Cenário: Selecionar direção da transferência - Ambas
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E seleciono a opção "Direção" "Ambas"
    E aciono o botão "Aplicar"
    Então todas as transferências devem ser listadas

    Cenário: Seleção de usuário que enviou ou recebeu
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Filtros"
    E insiro o "nome de usuário" - "Cíntia"
    E é exibida a lista de usuários que contém a palavra chave
    E seleciono o usuário "Cíntia Maria Belém"
    E aciono o botão "Aplicar"
    Então todas as transferências que envolveram o usuário devem ser listadas


   
>>>>>>> 33953d0 (Atualização dos casos de teste):Casos de testes/TransferenciasFiltro.feature
