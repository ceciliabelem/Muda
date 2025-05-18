Funcionalidade: Conta congelada

@regressivo @funcional @critico @smoke
Cenário: Visualizar painel home logada congelada
        Dado que acesso a página de login (https://muda.cambiatus.io/)
        Quando aciono o botão "Já sou membro"
        E insiro as 12 palavras chave
        Ou aciono o botão "Colar" as 12 palavras chave
        E clico em "Continuar"
        E insiro e confirmo o "Pin"
        E visualizo a modal "Diretrizes"
        E aciono o botão "Não aceito"
        Quando confirmo acionando o botão "Não aceito"
        Então sou direcionada para a home congelada
        E visualizo a home congelada com os seguintes componentes:
            | Card "Conta congelada"
                Título "Sua conta está congelada"
                Texto - 
                    "Você não aceitou as Diretrizes da comunidade e Código de conduta.
                    Para resolver essa situação e fazer parte da comunidade,"" 
                Link "Para que vocêaceite as Diretrizes da comunidade e Código de conduta." - https://www.cambiatus.com/pt-br/codigo-de-conduta 
            |
            | Bloco "Transações"
                Saldo em Muda no formato "XX - quebra de linha - Seu saldo em muda"
                Botão "Transferir" desabilitado 
                Botão "Nos apoie" desabilitado 
                Botão "Como ganhar MUDA" desabilitado 
                Botão " Convide seus amigos" desabilitado
                Botão "Minhas reivindicações" habilitado
                Botão "Minhas ofertas" habilitado
                Botão "Sobre a Comunidade" habilitado 
            |
            | Bloco "Transferências"
                Botão "Filtro" habilitado
                Texto "Nenhuma transferência."
            |


@regressivo @funcional @nao-bloqueante
Cenário: Visualizar página de ofertas
    Dado que estou com a conta congelada
    Quando acesso a página de ofertas
    Então acima da lista de ofertas é exibido o card de "Conta congelada"
        |Card "Conta congelada"
            Título "Sua conta está congelada"
            Texto - 
                "Você não aceitou as Diretrizes da comunidade e Código de conduta.
                Para resolver essa situação e fazer parte da comunidade,"" 
            Link "Para que vocêaceite as Diretrizes da comunidade e Código de conduta." - https://www.cambiatus.com/pt-br/codigo-de-conduta 
        |


@regressivo @funcional @nao-bloqueante
Cenário: Visualizar oferta que custa o valor do saldo disponível (20 muda)- https://muda.cambiatus.io/shop/2296
    Dado que acesso a oferta "Audiolivro "A vida não é útil", de Ailton Krenak"
    E o valor é 20 muda
    E o saldo disponível é 20 muda
    Mas estou com a conta congelada
    Então o botão "Comprar" está desabilitado


@regressivo @funcional @nao-bloqueante
Cenário: Aceitar as diretrizes estando com a conta congelada
    Dado que estou na home congelada
    Quando aciono o link "aceite as Diretrizes da comunidade e Código de conduta."
    E é aberta a  modal "Diretrizes da comunidade e Código de conduta 1.0"
    E aciono o botão "Aceito"
    Então sou direcionada para o painel da home logada Muda com todas as funcionalidades ativas - https://muda.cambiatus.io/dashboard

