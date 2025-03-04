Funcionalidade: Perfil

    Cenário: Visualizar Perfil EM PROCESSO
        Dado que acesso a página de login (https://muda.cambiatus.io/)
        E aciono o botão "Já sou membro"
        E insiro as 12 palavras chave
        E aciono o botão "Continuar"
        E insiro e confirmo o "Pin"
        E sou direcionada para o painel logado
        E aciono o botão "Minha Conta"
        Então visualizo o perfil com os componentes: 
            Botão "Voltar",
            "Foto de perfil",
            "Nome completo",
            "Email",
            "nome de usuário",
            Botões 
                "Editar perfil" 
                E "Ver no explorador de blocos", 
            E os dados 
            "Localização", 
            "Interesses", 
            "Opções de contato seguidos de botão "Editar", 
            "Saldo Total",
            "Número de transferências", 
            "Número de reivindicações",
            "Itens na loja",
            "Membro desde",
            "Última transação (data)"
            E "Últimas transferências"

    Cenário: Editar Perfil com cados válidos
        Dado que acesso a página de "perfil"
        E aciono o botão "Editar perfil"
        E insiro um novo "Nome completo"
        E insiro um novo "e-mail"
        E preencho a "biografia"
        E insiro uma nova "localização"
        E seleciono os "interesses"
        E aciono o botão "Salvar"
        Então visualizo a mensagem "Perfil salvo com sucesso"
    
    Cenário: Editar Perfil com dados inválidos - Trello #1
        Dado que acesso a página de "perfil"
        E aciono o botão "Editar perfil"
        E insiro um novo "Nome completo"
        E insiro um novo "e-mail" inválido
        E preencho a "biografia"
        E insiro uma nova "localização"
        E seleciono os "interesses"
        E aciono o botão "Salvar"
        Então visualizo a mensagem "Perfil salvo com sucesso"

    Cenário: Ver no explorador de blocos
        Dado que acesso a página de "perfil"
        E aciono o botão "Ver no explorador de blocos"
        Então sou direcionada para a página do explorador de blocos

    Cenário: Editar Opções	de contato
        Dado que acesso a página de "perfil"
        E aciono o botão "Editar perfil"
        E aciono o botão "Editar" em "Opções de contato"
        E insiro um novo "e-mail"
        E insiro uma conta de "Instagram"
        E insiro um "link" para site
        E insiro um novo "telefone"
        E insiro um novo "nome de usuário" para "telegram"
        E insiro um contato para "whatsapp"
        E aciono o botão "Salvar"
        Então sou direcionada para a tela inicial de perfil
        E visualizo a mensagem "Seus contatos foram salvos com sucesso"

    Cenário: Editar Opções	de contato com dados inválidos - Trello #2
        Dado que acesso a página de "perfil"
        E aciono o botão "Editar contato"
        E aciono o botão "Editar" em "Opções de contato"
        E insiro um novo "e-mail" inválido
        E insiro uma conta de "Instagram"
        E insiro um "link" inválido para site - massa: "lorem"
        E insiro um novo "telefone" inválido
        E insiro um novo "nome de usuário" para "telegram" inválido
        E insiro um contato para "whatsapp" inválido
        E aciono o botão "Salvar"
        Então sou direcionada para a tela inicial de perfil
        E visualizo a mensagem "Seus contatos foram salvos com sucesso"

    Cenário: Deletar dado de contato cadastrado
        Dado que acesso a página de "perfil"
        E aciono o botão "Editar" em "Opções de contato"
        E aciono o botão "Excluir" em um dos contatos cadastrados
        E visualizo a modal "Excluir" 
            Com botão "Fechar" 
            O texto "Quer mesmo excluir sua informação de contato?"
            Botão "Não"
            Botão "Sim"
        E aciono o botão "Sim"
        Então visualizo a mensagem "Seu contato foi removido com sucesso"
        E a caixa de edição fica vazia


    Cenário: Acessar detalhes de transferência

