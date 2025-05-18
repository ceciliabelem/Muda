Funcionalidade: Login

@regressivo @funcional @critico @smoke
Cenário: Login com sucesso
    Dado que acesso a página de login (https://muda.cambiatus.io/)
    Quando aciono o botão "Já sou membro"
    E insiro as 12 palavras-chave
    E clico em "Continuar"
    E insiro e confirmo o "PIN"
    Então sou direcionada para o painel logado

@regressivo @funcional @critico
Cenário: Login com palavras chave inválidas
    Dado que acesso a página de login (https://muda.cambiatus.io/)
    Quando aciono o botão "Já sou membro"
    E insiro as 12 palavras-chave inválidas
    E clico em "Continuar"
    Então é exibido o alerta "Essas palavras não são válidas: sombrinha, estilete, ramalhete, arvore, salsinha, flores, verao. Verifique suas 12 palavras e tente novamente"

@regressivo @funcional @critico
Cenário: Login com menos de 12 palavras-chave
    Dado que acesso a página de login (https://muda.cambiatus.io/)
    Quando aciono o botão "Já sou membro"
    E insiro as 11 palavras-chave
    E clico em "Continuar"
    Então é exibido o alerta "Por favor, digite 12 palavras"

@regressivo @funcional @critico
Cenário: Tentativa de login sem inserir palavras-chave
    Dado que acesso a página de login (https://muda.cambiatus.io/)
    Quando aciono o botão "Já sou membro"
    E clico em "Continuar"
    Então é exibido o alerta "Por favor, digite 12 palavras"

@regressivo @funcional @nao-bloqueante
Cenário: Tentativa de login com visualização do PIN inserido
    Dado que acesso a página de login (https://muda.cambiatus.io/)
    Quando aciono o botão "Já sou membro"
    E insiro as 12 palavras-chave
    E clico em "Continuar"
    E insiro um PIN válido
    E confirmo o PIN válido
    E aciono o botão "Mostrar" o PIN inserido
    Então o PIN é exibido

@regressivo @funcional @critico
Cenário: Tentativa de login com PIN inválido - 3 caracteres
    Dado que acesso a página de login (https://muda.cambiatus.io/)
    Quando aciono o botão "Já sou membro"
    E insiro as 12 palavras-chave
    E clico em "Continuar"
    E insiro um PIN de 3 caracteres
    E confirmo o PIN de 3 caracteres
    Então é exibido o alerta "O texto deve ter exatamente 6 caracteres"

@regressivo @funcional @critico
Cenário: Tentativa de login com confirmação de PIN divergente
    Dado que acesso a página de login (https://muda.cambiatus.io/)
    Quando aciono o botão "Já sou membro"
    E insiro as 12 palavras-chave
    E clico em "Continuar"
    E insiro o PIN "147258"
    E confirmo o PIN com valor divergente "258147"
    Então é exibido o alerta de PIN divergente