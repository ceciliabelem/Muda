Funcionalidade: Cadastro de usuário
    Cenário: Cadastro de usuário com sucesso
        Dado que acesso a página de convite (https://muda.cambiatus.io/register/Pzz98P)
        Quando aciono o botão "Sim, fazer parte"
        E informo o "Nome Completo" como "Planta Teste"
        E informo o nome de usuário com 12 caracteres
        E informo o "E-mail" como "massadetestesmuda@gmail.com"
        E confirmo clico em "Continuar"
        Então o usuário é cadastrado com sucesso

    Cenário: Cadastro de usuário com somente 1 nome
        Dado que acesso a página de convite (https://muda.cambiatus.io/register/Pzz98P)
        Quando aciono o botão "Sim, fazer parte"
        E informo o "Nome Completo" como "Planta"
        E informo o nome de usuário com 12 caracteres
        E informo o "E-mail" como "massadetestesmuda@gmail.com"
        E confirmo clico em "Continuar"
        Então é exibido o alerta "Opa. Algo de errado aconteceu enquanto criavamos sua conta"

    Cenário: Cadastro de usuário com nome de usuário com menos de 12 caracteres
        Dado que acesso a página de convite (https://muda.cambiatus.io/register/Pzz98P)
        Quando aciono o botão "Sim, fazer parte"
        E informo o "Nome Completo" como "Planta Teste"
        E informo o nome de usuário com 11 caracteres
        E informo o "E-mail" como "massadetestesmuda@gmail.com"
        E confirmo clico em "Continuar"
        Então é retornado o alerta na caixa de edição "nome de usuário" com a mensagem "O texto deve ter exatamente 12 caracteres"

    Cenário: Cadastro de usuário com e-mail inválido
        Dado que acesso a página de convite (https://muda.cambiatus.io/register/Pzz98P)
        Quando aciono o botão "Sim, fazer parte"
        E informo o "Nome Completo" como "Planta Teste"
        E informo o nome de usuário com 12 caracteres
        E informo o "E-mail" como "massadetestesmuda"
        E confirmo clico em "Continuar"
        Então é retornado o alerta na caixa de edição "E-mail" com a mensagem "Por favor, use um email válido."

    Cenário: Usuário recusa convite
        Dado que acesso a página de convite (https://muda.cambiatus.io/register/Pzz98P)
        Quando aciono o botão "Não, obrigado"
        E abre a modal "Atenção"
        E aciono o botão "Não, obrigado"
        Então sou direcionado para a página inicial

    Cenário: Usuário recusa convite e muda de ideia na modal "Atenção"
        Dado que acesso a página de convite (https://muda.cambiatus.io/register/Pzz98P)
        Quando aciono o botão "Não, obrigado"
        E abre a modal "Atenção"
        E aciono o botão "Sim, participar"        git remote remove origin        git reset        git reset
        Então sou direcionado para a página de cadastro

    Cenário: Usuário já tem cadastro
        Dado que acesso a página de convite (https://muda.cambiatus.io/register/Pzz98P)
        Quando aciono o botão "Sim, fazer parte"
        E aciono o botão "Login"
        Então sou direcionado para a página de inserção de palavras-chave