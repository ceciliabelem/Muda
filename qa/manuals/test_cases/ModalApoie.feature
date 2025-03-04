Funcionalidade: Painel logado
    Cenário: Visualizar e fechar modal "Apoie sua comunidade"
        Dado que acesso a página de login (https://muda.cambiatus.io/)
        Quando aciono o botão "Já sou membro"
        E insiro as 12 palavras chave
        Ou aciono o botão "Colar" as 12 palavras chave
        E clico em "Continuar"
        E insiro e confirmo o "Pin"
        E sou direcionada para o painel logado
        E visualizo a modal "Apoie sua comunidade"
        E aciono o botão "Fechar"
        Então a modal é fechada

    Cenário: Visualizar e apoiar a comunidade
        Dado que acesso a página de login (https://muda.cambiatus.io/)
        Quando aciono o botão "Já sou membro"
        E insiro as 12 palavras chave
        Ou aciono o botão "Colar" as 12 palavras chave
        E clico em "Continuar"
        E insiro e confirmo o "Pin"
        E sou direcionada para o painel logado
        E visualizo a modal "Apoie sua comunidade"
        E aciono o botão "Apoiar Muda"
        Então sou direcionada para a tela de apoiar a comunidade