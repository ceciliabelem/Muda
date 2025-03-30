Funcionalidade: Notificações

Cenário: Visualizar notificações
    Dado que o usuário está logado no sistema
    Quando o usuário acessa a página de "Notificações"
    Então o usuário deve ver uma lista de notificações de transações recentes em ordem decrescente
    E visualizo:
        | Título da notificação com nome do usuário que participou da transação |
        | Data da notificação  | 
        | Valor em Muda da transação |
            | Tipo transação (negativo/positivo) |


Cenário: Visualizar detalhes da notificação
    Dado que o usuário está logado no sistema
    E o usuário acessa a página de "Notificações"
    Quando o usuário clica em uma notificação específica
    Então o usuário deve ver os detalhes da notificação selecionada
    E visualizo:
        | Botão "Voltar" |
        | Título "Transferido" |
        | Título "Recebido com sucesso!" |
        | Texto "Esse ID garante a autenticidade da transação se ambos os lados tiverem os mesmos emojis." |
        | Sequencia de emojis referente a transação |
        | Botão "Usuário logado" |
        | Seta direcional do fluxo da transação (< para receber e > para enviar)
        | Valor em Muda na transação |
        | Seta direcional do fluxo da transação (< para receber e > para enviar)
        | Texto "Data da transação" | 
        | Data da transação |
        | Botão "Ver no explorador de blocos" |
        | Botão "Meu Saldo" |


Cenário: Ver a transação no explorador de blocos
    Dado que o usuário está logado no sistema
    E visualiza uma notificação
    Quando aciona o botão "Ver no explorador de blocos"
    Então o usuário deve ser redirecionado para a página do explorador de blocos (https://local.bloks.io/)


Cenário: Ver o saldo do usuário
    Dado que o usuário está logado no sistema
    E visualiza uma notificação
    Quando aciona o botão "Meu Saldo"
    Então o usuário deve ser redirecionado para a home logada 
    E visualizo o bloco do "Saldo"

Cenário: Visualizar miniatura do perfil de usuário que participou da transação
    Dado que o usuário está logado no sistema
    E o usuário acessa a página de "Notificações"
    E foca no botão de "Usuário logado" e de "Usuário que participou da transação"
    Então deve abrir uma modal com os seguintes componentes:
        | Nome do usuário |
        | E-mail |
        | Nome de usuário |
        | Bio do usuário |
        | Botões de redes sociais / contato |
        | Botão "Ver perfil completo" |
    