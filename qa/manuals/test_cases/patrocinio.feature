Funcionalidade: Doação - Patrocínio

@regressivo @funcional @critico @smoke
Cenário: Visualizar a tela Patrocínio
    Dado que acesso a página de "Patrocínio"
    Então visualizo a página com os seguintes componentes:
        | Botão "Voltar"                              |
        | Título "Muda"                               |
        | Texto "Digite o valor que deseja contribuir"|
        | Caixa de edição "Valor"                     |
        | Texto "Selecione a moeda que deseja usar"   |
        | Caixa de seleção "Seleção de moeda"         |
        | Botão "PayPal"                              |
        | Botão "Debit or Credit Card"                |
        | Texto "Powered by PayPal"                   |


@regressivo @funcional @nao-bloqueante
Cenário:  Valor negativo em diferentes moedas
    Dado que acesso a página de "Patrocínio"
    Quando insiro o valor "<valor>"
    E seleciono a moeda "<moeda>"
    Então visualizo o valor não é inserido na caixa de texto

    Exemplos:
    | valor | moeda |
    | -1    | BRL   |
    | -1    | USD   |


@regressivo @funcional @nao-bloqueante
Cenário: Valor 0 em diferentes moedas
    Dado que acesso a página de "Patrocínio"
    Quando insiro o valor "0"
    E seleciono a moeda
    Então visualizo o feedback "Insira um valor válido"

    Exemplos:
    | valor | moeda |
    |   0   | BRL   |
    |   0   | USD   |


@regressivo @funcional @nao-bloqueante
Cenário: Inserção de valor acima do máximo permitido
  # MELHORIA: Feedback para o usuário sobre valor máximo
  # BUG: Com valor máximo não é possível acessar a tela de pagamento do PayPal
    Dado que acesso a página de "Patrocínio"
    Quando insiro o valor "999.000.000.000.000.000,00"
    E insiro mais um dígito
    Então o valor da caixa de edição é reiniciado para vazio

@regressivo @funcional @critico
Cenário: Pagamento com PayPal em diferentes moedas
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E seleciono a moeda
    Quando aciono o botão "PayPal"
    Então sou direcionado para a tela de pagamento do PayPal

    Exemplo:
    | moeda |
    | BRL   |
    | USD   |


@regressivo @funcional @critico
Cenário: Pagamento com cartão de crédito ou crédito em diferentes moedas 
# MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E seleciono a moeda
    E aciono o botão "Debit or Credit Card"
    Então visualizo o formulário de pagamento com os seguintes campos:
        | Caixa de edição "Número do cartão" |
        | Caixa de edição "Data de validade" |
        | Caixa de edição "Código de segurança" |
        | Título: Endereço de cobrança |
        | Caixa de edição "País" |
        | Caixa de edição "Primeiro nome do titular" |
        | Caixa de edição "Último nome do titular" |
        | Caixa de edição "CEP" |
        | Caixa de edição "Celular" |
        | Caixa de edição "E-mail" |
        | Texto "By continuing, you confirm you’re 18 years or older." |
        | Botão "Pagar [valor]" - Valor |
        | Texto "Powered by Paypal" |
        

@regressivo @funcional @critico
Cenário: Cartão - número ausente em diferentes moedas | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E seleciono a moeda
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto Número do cartão
    Então visualizo o feedback na caixa de edição "Número do cartão" com bordas vermelhas


@regressivo @funcional @critico
Cenário: Cartão - CVV ausente em diferentes moedas 
# MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E seleciono a moeda
    E aciono o botão "Debit or Credit Card"
    Quando preencho todos os campos, exceto o "CVV"
    Então visualizo um destaque em vermelho na caixa de edição "CVV"
    

@regressivo @funcional @critico
Cenário: Cartão - validade ausente em diferentes moedas| MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E seleciono a moeda
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto data de validade
    Então visualizo o feedback na caixa de edição "Validade" com bordas vermelhas


@regressivo @funcional @critico
Cenário: Testar API cartão de crédito em diferentes moedas dados inválidos - Sem nome do titular - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E seleciono a moeda
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto nome do titular
    Então visualizo o feedback na caixa de edição "Nome do titular" com bordas vermelhas 


@regressivo @funcional @critico
Cenário: Testar API cartão de crédito em diferentes moedas dados inválidos - Sem sobrenome do titular - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E seleciono a moeda
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto sobrenome do titular
    Então visualizo o feedback na caixa de edição "Sobrenome" com bordas vermelhas 


@regressivo @funcional @critico
Cenário: Testar API cartão de crédito em diferentes moedas dados inválidos - Sem CEP - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E seleciono a moeda
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto número do CEP
    Então visualizo o feedback na caixa de edição "CEP" com bordas vermelhas 


@regressivo @funcional @critico
Cenário: Testar API cartão de crédito em diferentes moedas dados inválidos - Sem celular - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E seleciono a moeda
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto número do Celular
    Então visualizo o feedback na caixa de edição "Celular" com bordas vermelhas 


@regressivo @funcional @critico
Cenário: Testar API cartão de crédito em diferentes moedas dados inválidos - Sem e-mail - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E seleciono a moeda
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto e-mail
    Então visualizo o feedback na caixa de edição "E-mail" com bordas vermelhas 


@regressivo @funcional @critico
Cenário: Testar API cartão de crédito em diferentes moedas dados inválidos - Sem país - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E seleciono a moeda
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto País
    Então visualizo o feedback na caixa de edição "País" com bordas vermelhas 


@regressivo @funcional @critico
Cenário: Testar API cartão de crédito em diferentes moedas dados inválidos - Sem endereço - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E seleciono a moeda
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto Endereço
    Então visualizo o feedback na caixa de edição "Endereço" com bordas vermelhas 


@regressivo @funcional @critico
Cenário: Testar API cartão de crédito em diferentes moedas dados inválidos - Sem cidade - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E seleciono a moeda
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto Cidade
    Então visualizo o feedback na caixa de edição "Cidade" com bordas vermelhas