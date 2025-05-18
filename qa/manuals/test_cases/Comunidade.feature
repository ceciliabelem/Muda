Funcionalidade: Comunidade (https://muda.cambiatus.io/community/about)

@regressivo @funcional @critico @smoke
Cenário: Visualizar Comunidade
    Dado que acesso a página de "Comunidade"
    Então visualizo a página com os componentes:
        | Banner decorativo |
        | Título "Muda" |
        | Botão "Compartilhar" |
        | Texto Cambiatus Community |
        | Botão "Ganhe Muda" |
        | Bloco "Nossos Apoiadores" |
            | Texto "Você pode contribuir financeiramente para o crescimento desta comunidade." |
            | Botão "Nos apoie" |
            | Texto "Veja os últimos membros que nos apoiaram." |
            | Lista com últimos 5 contriuintes |
            | Botão "Ver todos os apoiadores" |

        | Bloco "Nossos Comunicados" |
            | Data mais recente de comunicados da comunidade |
            | Notícia por data |
            | Botão "Ver todas as notícias" |

        | Bloco "Nossos Números" |
            | Valor em Muda |
            | Quantidade de usuários ativos |
            | Quantidade de reivindicações |
            | Quantidade de transações |
            | Quantidade de vendas na loja |
            | Quantidade de vendas na loja |


@regressivo @funcional @nao-bloqueante
Cenário: Compartilhar comunidade
    Dado que acesso a página de "Comunidade"
    E aciono o botão "Compartilhar"
    Então sou direcionada para a tela de compartilhamento
    E visualizo os botões de compartilhamento nativos do sistema operacional:


@regressivo @funcional @nao-bloqueante
Cenário: Ganhe Muda
    Dado que acesso a página de "Comunidade"
    Quando aciono o botão "Ganhe Muda"
    Então sou direcionada para a tela de "Ganhe Muda" - Reivindicações


@regressivo @funcional @nao-bloqueante
Cenário: Acessar "Nos Apoie"
    Dado que acesso a página de "Comunidade"
    E aciono o botão "Nos apoie"
    Então sou direcionada para a tela de "Apoie"


@regressivo @funcional @nao-bloqueante
Cenário: Acessar "Ver todos os apoiadores"
    Dado que acesso a página de "Comunidade"
    Quando aciono o botão "Ver todos os apoiadores"
    Então sou direcionada para a tela de "Nossos Apoiadores" - https://muda.cambiatus.io/community/supporters
    E visualizo a lista de apoiadores com os seguintes componentes:
        | Botão "Voltar" |
        | Título "Nossos Apoiadores" |
        | Data do apoio |
        | Nome do apoiador |


@regressivo @funcional @nao-bloqueante
Cenário: Acessar notícia individual
    Dado que acesso a página de "Comunidade"
    Quando aciono o botão da notícia "Celebra Muda 2024"
    Então sou direcionada para a tela de "Detalhes do comunicado" - https://muda.cambiatus.io/news/33?showOthers=false
   E visualizo a página com os seguintes componentes:
        | Botão "Voltar" |
        | Título "Comunicados" |
        | Texto escrito e formatado pelo autor |
        | Botão de reagir |
        | Lista de reações realizadas |