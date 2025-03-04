<<<<<<< HEAD:qa/manuals/test_cases/Transferencia.feature
Funcionalidade: Transferência
    
    @regressivo @funcional @critico @smoke
    Cenário: Acessar a tela de transferência
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    Então visualizo a tela de transferência
    E visualizo o campo "nome de usuário"
    E visualizo o campo "Valor"
    E visualizo o campo "Saldo disponível"
    E visualizo o campo "mensagem"
    E visualizo o botão "Transferir"

    @regressivo @funcional @critico
    Cenário: Buscar usuário
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    E insiro o "nome de usuário" - "Cíntia"
    Então visualizo uma lista com os nomes de usuário que contém a palavra chave


    @regressivo @funcional @critico
    Cenário: Inserir 2o nome de usuário após busca do primeiro
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    E insiro o "nome de usuário" - "Cíntia"
    E insiro o "nome de usuário" "Ivanilson"
    Então o nome de usuário deve ser alterado de "Cíntia" para "Ivanilson"

    @regressivo @funcional @critico
    Cenário: Excluir nome de usuário
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    E insiro o "nome de usuário" - "Cíntia"
    E aciono o botão "excluir"
    Então o nome de usuário deve ser excluído

    @regressivo @funcional @critico
    Cenário: Efetuar transação sem saldo
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    E insiro o "nome de usuário" - "Cíntia"
    E insiro o "valor" - "1000"
    Então visualizo a mensagem "Você não tem MUDA o suficiente para transferir esta quantia. Você pode transferir até 266 MUDA"

    
    @regressivo @funcional @critico @smoke
    Cenário: Efetuar transação com saldo
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    E insiro o "nome de usuário" - "Cíntia"
    E insiro o "valor" - "10"
    E insiro a "mensagem" - "teste"
    E aciono o botão "Transferir"
    Então sou direcionada para a tela de confirmação https://muda.cambiatus.io/transfer/24467

    Cenário: Visualizar transação
    Dado que acesso a transação https://muda.cambiatus.io/transfer/24467
    Então visualizo a transação com os campos
        Botão "Voltar\"
        "Transferência realizada com sucesso!"
        "Esse ID garante a autenticidade da transação se ambos os lados tiverem os mesmos emojis."
        "Remetente"
        "Valor"
        "Destinatário"
        "Data"
        "Mensagem"
        Botão "Ver no explorador de blocos"
        Botão "Meu Saldo"

    @regressivo @funcional @critico
    Cenário: Tentar transferir sem inserir usuário destinatário
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    E insiro o "valor" - "10"
    E insiro a "mensagem" - "teste"
    E aciono o botão "Transferir"
    Então visualizo a mensagem "Selecione um usuário"

    @regressivo @funcional @critico
    Cenário: Tentar transferir sem inserir valor
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    E insiro o "nome de usuário" - "Cíntia"
    E insiro a "mensagem" - "teste"
    E aciono o botão "Transferir"
    Então visualizo a mensagem "Quantidade deve ser positiva"

    @regressivo @funcional @nao-bloqueante
    Cenário: Visualizar transferência no painel
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E visualizo a lista de transferências
    Então visualizo detalhes da transação realizada

=======
Funcionalidade: Transferência
    
    Cenário: Acessar a tela de transferência
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    Então visualizo a tela de transferência
    E visualizo o campo "nome de usuário"
    E visualizo o campo "Valor"
    E visualizo o campo "Saldo disponível"
    E visualizo o campo "mensagem"
    E visualizo o botão "Transferir"

    Cenário: Buscar usuário
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    E insiro o "nome de usuário" - "Cíntia"
    Então visualizo uma lista com os nomes de usuário que contém a palavra chave


    Cenário: Inserir 2o nome de usuário após busca do primeiro
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    E insiro o "nome de usuário" - "Cíntia"
    E insiro o "nome de usuário" "Ivanilson"
    Então o nome de usuário deve ser alterado de "Cíntia" para "Ivanilson"

    Cenário: Excluir nome de usuário
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    E insiro o "nome de usuário" - "Cíntia"
    E aciono o botão "excluir"
    Então o nome de usuário deve ser excluído

    Cenário: Efetuar transação sem saldo
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    E insiro o "nome de usuário" - "Cíntia"
    E insiro o "valor" - "1000"
    Então visualizo a mensagem "Você não tem MUDA o suficiente para transferir esta quantia. Você pode transferir até 266 MUDA"

    
    Cenário: Efetuar transação com saldo
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    E insiro o "nome de usuário" - "Cíntia"
    E insiro o "valor" - "10"
    E insiro a "mensagem" - "teste"
    E aciono o botão "Transferir"
    Então sou direcionada para a tela de confirmação https://muda.cambiatus.io/transfer/24467

    Cenário: Visualizar transação
    Dado que acesso a transação https://muda.cambiatus.io/transfer/24467
    Então visualizo a transação com os campos
        Botão "Voltar\"
        "Transferência realizada com sucesso!"
        "Esse ID garante a autenticidade da transação se ambos os lados tiverem os mesmos emojis."
        "Remetente"
        "Valor"
        "Destinatário"
        "Data"
        "Mensagem"
        Botão "Ver no explorador de blocos"
        Botão "Meu Saldo"

    Cenário: Tentar transferir sem inserir usuário destinatário
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    E insiro o "valor" - "10"
    E insiro a "mensagem" - "teste"
    E aciono o botão "Transferir"
    Então visualizo a mensagem "Selecione um usuário"

    Cenário: Tentar transferir sem inserir valor
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E aciono o botão "Transferir"
    E insiro o "nome de usuário" - "Cíntia"
    E insiro a "mensagem" - "teste"
    E aciono o botão "Transferir"
    Então visualizo a mensagem "Quantidade deve ser positiva"

    Cenário: Visualizar transferência no painel
    Dado que acesso o painel logado https://muda.cambiatus.io/dashboard
    E visualizo a lista de transferências
    Então visualizo detalhes da transação realizada

   
>>>>>>> 33953d0 (Atualização dos casos de teste):Casos de testes/Transferencia.feature
