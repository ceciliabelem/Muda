Funcionalidade: convite

@regressivo @funcional @critico
Cenário: Convidar amigo
    Dado que o usuário está logado no sistema
    E o usuário aciona o botão "Convide seus amigos"
    Então o usuário deve ver uma modal com os seguintes componentes:
        | Título "Convide um amigo" |
        | Botão "Fechar" |
        | Texto "Envie essa URl para seus amigos" |
        | Link de convite |
        | Botão "Copiar" |
