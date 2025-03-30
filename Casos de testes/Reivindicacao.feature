Funcionalidade: Reivindicação de Muda

    Cenário: Reivindicar Muda
        Dado que o usuário está logado no sistema
        E o usuário acessa a página de "Minhas Reivindicações"
        Então sou direcionada para a tela "Minhas Reivindicações"
        E visualizo:
            | Botão "Voltar" |
            | Título "Minhas Reivindicações" |
            | Card "Lembre-se" |
                | Lista com o texto:
                    | Lembre-se | 
                        | - Não reivindique a mesma ação mais de uma vez no mesmo dia; |
                        | - Reivindique apenas ações que você realmente realizou; |
                        | - Conheça as boas práticas da Comunidade |
            | Guia com as seguintes abas: |
                | Esperando voto (quatidade esperando voto) |
                | Analisadas (quantidade já analisada) |
                | Filtros |
                | Reivindicadas (quantidade reivindicada) |
                | Ordenador - ASC / Desc |
        
    Cenário: Visualizar modal de "Filtros"
        Dado que o usuário está logado no sistema
        E o usuário acessa a página de "Minhas Reivindicações"
        E a aba "Esperando voto" ou "Analisadas" já está aberta
        Quando o usuário clica no botão "Filtros"
        Então o usuário deve ver uma modal com os seguintes componentes:
            | Título "Filtros" |
            | Botão "Fechar" |
            | Texto "Estado da ação" |
            | Caixa de seleção com as opções: "Todos" / Aprovado / Reprovado / Completa |
            | Botão "Aplicar" |

    Cenário: Filtrar por "Todos"
        Dado que o usuário está logado no sistema
        E o usuário acessa a página de "Minhas Reivindicações"
        E a aba "Esperando voto" ou "Analisadas" já está aberta
        E o usuário clica no botão "Filtros"
        E abre a modal "Filtros"
        E seleciona a opção "Todos"
        Quando o usuário clica no botão "Aplicar"
        Então o usuário deve ver uma lista de ações com o estado "Todos" na aba "Esperando voto"
        E visualiza os cards das reivindicações com os componentes:
            | Botão de "Usuário logado" |
            | Miniatura da imagem anexada na reivindicação |
            | Texto "Aberto x dias atrás" |
            | Texto com o nome da ação reivindicada |
            | Data da reivindicação |
            | Texto "Aprovado" / "Reprovado" |
            | Barra de status de votos em terços |
            | Texto com quandidade de votos |
            | Botão "Mais detalhes" |

    Cenário: Filtrar por "Aprovado"
        Dado que o usuário está logado no sistema
        E o usuário acessa a página de "Minhas Reivindicações"
        E a aba "Esperando voto" ou "Analisadas" já está aberta
        E o usuário clica no botão "Filtros"
        E abre a modal "Filtros"
        E seleciona a opção "Aprovado"
        Quando o usuário clica no botão "Aplicar"
        Então o usuário deve ver uma lista de ações com o estado "Aprovado" na aba "Esperando voto"
        E visualiza os cards das reivindicações.

    Cenário: Filtrar por "Reprovado"
        Dado que o usuário está logado no sistema
        E o usuário acessa a página de "Minhas Reivindicações"
        E a aba "Esperando voto" ou "Analisadas" já está aberta
        E o usuário clica no botão "Filtros"
        E abre a modal "Filtros"
        E seleciona a opção "Reprovado"
        Quando o usuário clica no botão "Aplicar"
        Então o usuário deve ver uma lista de ações com o estado "Reprovado" na aba "Esperando voto"
        E visualiza os cards das reivindicações.

    Cenário: Filtrar por "Completa"
        Dado que o usuário está logado no sistema
        E o usuário acessa a página de "Minhas Reivindicações"
        E a aba "Esperando voto" ou "Analisadas" já está aberta
        E o usuário clica no botão "Filtros"
        E abre a modal "Filtros"
        E seleciona a opção "Completa"
        Quando o usuário clica no botão "Aplicar"
        Então o usuário deve ver uma lista de ações com o estado "Completa" na aba "Esperando voto"
        E visualiza os cards das reivindicações.

    Cenário: Ordenar as reivindicações - Crescente
        Dado que o usuário está logado no sistema
        E o usuário acessa a página de "Minhas Reivindicações"
        E a aba "Esperando voto" ou "Analisadas" já está aberta
        Quando o usuário clica no botão "Ordenador" em "ASC"
        Então os cards são ordenados em modo "Crescente"

    Cenário: Ordenar as reivindicações - Decrescente
        Dado que o usuário está logado no sistema
        E o usuário acessa a página de "Minhas Reivindicações"
        E a aba "Esperando voto" ou "Analisadas" já está aberta
        Quando o usuário clica no botão "Ordenador" em "DESC"
        Então os cards são ordenados em modo "Decrescente"

    Cenário: Foco no botão "Usuário logado"
        Dado que o usuário está logado no sistema
        E acessa a página de "Minhas Reivindicações"
        E a aba "Esperando voto" ou "Analisadas" já está aberta
        E o usuário foca no botão "Usuário logado"
        Então deve abrir uma modal com os seguintes componentes:
            | Nome do usuário |
            | E-mail |
            | Nome de usuário |
            | Bio do usuário |
            | Botões de redes sociais / contato |
            | Botão "Ver perfil completo" |
    
    Cenário: Acessar miniatura da imagem anexada na reivindicação
        Dado que o usuário está logado no sistema
        E acessa a página de "Minhas Reivindicações"
        E a aba "Esperando voto" ou "Analisadas" já está aberta
        E o usuário clica na miniatura da imagem anexada na reivindicação
        Então deve abrir uma modal com os seguintes componentes:
            | Título Reivindicar |
            | Botão "Fechar" |
            | Imagem em tamanho maior |
            | Link "Ver prova inteira" |
            
    Cenário: Acessar "Mais detalhes" da Reivindicação
        Dado que o usuário está logado no sistema
        E acessa a página de "Minhas Reivindicações"
        E a aba "Esperando voto" ou "Analisadas" já está aberta
        E o usuário clica no botão "Mais detalhes"
        Então abre a modal "Detalhes da Reivindicação"
        E visualizo:
            | Botão "Fechar" |
            | Texto "Reivindicado em DD-MM-YYYY" |
            | Título "Reivindicação" |
            | Título de status da ação - "Aprovado" / "Rejeitado" / "Aguardando" |
            | Texto Status - "Aprovado" / "Rejeitado" / Aguardando |
            | Texto com total de votos - "Aprovado" / "Rejeitado" / "Aguardando" |
            | Valor em muda "Recompensa" |
            | Valor em muda "Recompensa do analista"
            | Botão "Ver detalhes" |

    Cenário: Ver detalhes da reivindicação
        Dado que o usuário está logado no sistema
        E acessa a página de "Minhas Reivindicações"
        E a aba "Esperando voto" ou "Analisadas" já está aberta
        E acessa os detalhes da reivindicação
        Então é direcionada para a tela "Detalhes da Reivindicação"
        E visualizo:
            | Botão "Voltar" |
            | Título da Reivindicação solicitada resumido + reticencias |
            | Botão "Perfil do usuário" |
            | Título "Reivindicação" + status "Aprovada" / "Rejeitada" / "Aguardando" |
            | Miniatura da imagem anexada na reivindicação |
            | Texto Status - "Aprovado" / "Rejeitado" / Aguardando |
            | Barra de status de votos em terços |
            | Texto com total de votos - "Aprovado" / "Rejeitado" / "Aguardando" |
            | Texto "Ação" |
            | Texto com o nome da ação
            | Texto "Reivindicado em DD-MM-YYYY" |
            | Título "Reivindicação" |
            | Título completo de status da ação - "Aprovado" / "Rejeitado" / "Aguardando" |
            | Texto "Data da Reivindicação" |
            | Data da Reivindicação |
            | Texto "Recompensa do usuário" |
            | Valor em muda "Recompensa do usuário" |
            | Texto "Objetivo" |
            | Texto descritivo do objetivo da ação |
            | Texto "Sua Recompensa" |
            | Texto com valor em muda da sua recompensa |
            | Texto aprovado por |
            | Lista de aprovadores / "ninguém" |
            | Texto Reprovado por |
            | Lista de reprovadores / "ninguém" |
            | Texto "Pendente" |
            | Lista de  admins pendentes de votos / "ninguém" |