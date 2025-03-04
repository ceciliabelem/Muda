Funcionalidade: Login
    Cenário: Login com sucesso
        Dado que acesso a página de login (https://muda.cambiatus.io/)
        Quando aciono o botão "Já sou membro"
        E insiro as 12 palavras chave
        Ou aciono o botão "Colar" as 12 palavras chave
        E clico em "Continuar"
        E insiro e confirmo o "Pin"
        Então sou direcionada para o painel logado

    Cenário: Login com palavras chave inválidas
        Dado que acesso a página de login (https://muda.cambiatus.io/)
        Quando aciono o botão "Já sou membro"
        E insiro as 12 palavras chave inválidas
        Ou aciono o botão "Colar" as 12 palavras chave inválidas
        E clico em "Continuar"
        Então é exibido o alerta "Essas palavras não são válidas: sombrinha, estilete, ramalhete, arvore, salsinha, flores, verao. Verifique suas 12 palavras e tente novamente"

    Cenário: Login com menos de 12 palavras chave
        Dado que acesso a página de login (https://muda.cambiatus.io/)
        Quando aciono o botão "Já sou membro"
        E insiro as 11 palavras chave
        Ou aciono o botão "Colar" as 11 palavras chave
        E clico em "Continuar"
        Então é exibido o alerta "Por favor, digite 12 palavras"

    Cenário: Tentativa de login sem inserir palavras chave
        Dado que acesso a página de login (https://muda.cambiatus.io/)
        Quando aciono o botão "Já sou membro"
        E clico em "Continuar"
        Então é exibido o alerta "Por favor, digite 12 palavras"

    Cenário: Tentativa de login com inserção de pin
        Dado que acesso a página de login (https://muda.cambiatus.io/)
        Quando aciono o botão "Já sou membro"
        E insiro as 12 palavras chave
        Ou aciono o botão "Colar" as 12 palavras chave
        E clico em "Continuar"
        E insiro um pin válido
        E confirmo o pin válido
        Então sou direcionada para o painel logado

    Cenário: Tentativa de login com visualização do pin inserido
        Dado que acesso a página de login (https://muda.cambiatus.io/)
        Quando aciono o botão "Já sou membro"
        E insiro as 12 palavras chave
        Ou aciono o botão "Colar" as 12 palavras chave
        E clico em "Continuar"
        E insiro um pin válido
        E confirmo o pin válido
        E aciono o botão "Mostar" o pin inserido
        Então o pin é exibido

    Cenário: Tentativa de login com pin inválido - 3 caracteres
        Dado que acesso a página de login (https://muda.cambiatus.io/)
        Quando aciono o botão "Já sou membro"
        E insiro as 12 palavras chave
        Ou aciono o botão "Colar" as 12 palavras chave
        E clico em "Continuar"
        E insiro um pin de 3 caracteres
        E confirmo o pin de 3 caracteres
        Então é exibido o alerta "O texto deve ter exatamente 6 caracteres"

    Cenário: Tentativa de login com confirmação de pin divergente
        Dado que acesso a página de login (https://muda.cambiatus.io/)
        Quando aciono o botão "Já sou membro"
        E insiro as 12 palavras chave
        Ou aciono o botão "Colar" as 12 palavras chave
        E clico em "Continuar"
        E insiro um pin válido
        E confirmo o pin com um divergente
        Então é exibido o alerta "Digite o mesmo PIN acima"