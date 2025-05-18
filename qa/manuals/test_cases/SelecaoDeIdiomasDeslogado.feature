Funcionalidade: Seleção de idiomas na home deslogada

@regressivo @funcional @nao-bloqueante @smoke
    Cenário: Seleção de idioma "Pt-BR" na home deslogada
        Dado que acesso a página inicial (https://muda.cambiatus.io/)
        Quando aciono o botão "Linguagens"
        E seleciono o idioma "Português (Brasil)"
        Então a página é traduzida para o idioma "Português (Brasil)"

@regressivo @funcional @nao-bloqueante
    Cenário: Seleção de idioma "En-US" na home deslogada
        Dado que acesso a página inicial (https://muda.cambiatus.io/)
        Quando aciono o botão "Linguagens"
        E seleciono o idioma "En-US"
        Então a página é traduzida para o idioma "Inglês (Estados Unidos)"

@regressivo @funcional @nao-bloqueante
    Cenário: Seleção de idioma "AMH" na home deslogada
        Dado que acesso a página inicial (https://muda.cambiatus.io/)
        Quando aciono o botão "Linguagens"
        E seleciono o idioma "AMH"
        Então a página é traduzida para o idioma "Amárico"

@regressivo @funcional @nao-bloqueante
    Cenário: Seleção de idioma "CAT" na home deslogada
        Dado que acesso a página inicial (https://muda.cambiatus.io/)
        Quando aciono o botão "Linguagens"
        E seleciono o idioma "CAT"
        Então a página é traduzida para o idioma "Catalão"

@regressivo @funcional @nao-bloqueante
    Cenário: Seleção de idioma "ES" na home deslogada
        Dado que acesso a página inicial (https://muda.cambiatus.io/)
        Quando aciono o botão "Linguagens"
        E seleciono o idioma "ES"
        Então a página é traduzida para o idioma "Espanhol"