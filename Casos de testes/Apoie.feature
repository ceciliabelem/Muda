Funcionalidade: Patrocínio

Cenário: Visualizar a tela Patrocínio
    Dado que acesso a página de "Patrocínio"
    Então visualizo a página com os seguintes componentes:
        | Botão "Voltar" |
        | Título "Muda" |
        | Texto "Digite o valor que deseja contribuir" |
        | Caixa de edição "Valor" |
        | Texto "Selecione a moeda que deseja usar" | 
        | Caixa de seleção "Seleção de moeda"
        | Botão "PayPal" |
        | Botão "Debit or Credit Card" |
        | Texto "Powered by Paypal" |

Cenário: Transação em Real (BRL)

Cenário: Transação em Dolar (USD)

Cenário: Valor -1
    Dado que acesso a página de "Patrocínio"
    Quando insiro o valor -1
    Então visualizo o valor não é inserido na caixa de texto 

Cenário: Valor 0
    Dado que acesso a página de "Patrocínio"
    Quando insiro o valor 0
    Então visualizo o feedback "Insira um valor válido"

Cenário: Valor máximo - 999 quatrilhões - | MELHORIA: FEEDBACK PARA O USUÁRIO SOBRE VALOR MÁXIMO | | BUG: COM VALOR MÁXIMO NAO É POSSÍVEL ACESSAR A TELA DE PAGAEMNTO PAYPAL /  |
    Dado que acesso a página de "Patrocínio"
    Quando insiro o valor "999.000.000.000.000.000,00"
    E insiro mais um algarismo
    Então o valor é reiniciado

Cenário: Pagamento com PayPal

    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E aciono o botão "PayPal"
    Então sou direcionada para a tela de pagamento do PayPal

Cenário: Pagamento com cartão de crédito ou crédito - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E aciono o botão "Debit or Credit Card"
    E é aberto o bloco de pagamento com os componentes:
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
        | Botão "Pagar xx,xx" - Valor |
        | Texto "Powered by Paypal" |
    Quando insiro os dados de pagamento
    Então o pagamento é processado com sucesso

Cenário: Testar API cartão de crédito - dados inválidos - Sem número - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto número do cartão
    Então visualizo o feedback na caixa de edição "Número do cartão" com bordas vermelhas

Cenário: Testar API cartão de crédito - dados inválidos - Sem CVV - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto número do CVV
    Então visualizo o feedback na caixa de edição "CVV" com bordas vermelhas 
    
Cenário: Testar API cartão de crédito - dados inválidos - Sem data de validade - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto data de validade
    Então visualizo o feedback na caixa de edição "Vaalidade" com bordas vermelhas 

Cenário: Testar API cartão de crédito - dados inválidos - Sem nome do titular - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto nome do titular
    Então visualizo o feedback na caixa de edição "Nome do titular" com bordas vermelhas 

Cenário: Testar API cartão de crédito - dados inválidos - Sem sobrenome do titular - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto sobrenome do titular
    Então visualizo o feedback na caixa de edição "Sobrenome" com bordas vermelhas 

Cenário: Testar API cartão de crédito - dados inválidos - Sem CEP - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto número do CEP
    Então visualizo o feedback na caixa de edição "CEP" com bordas vermelhas 

Cenário: Testar API cartão de crédito - dados inválidos - Sem celular - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto número do Celular
    Então visualizo o feedback na caixa de edição "Celular" com bordas vermelhas 

Cenário: Testar API cartão de crédito - dados inválidos - Sem e-mail - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto e-mail
    Então visualizo o feedback na caixa de edição "E-mail" com bordas vermelhas 

Cenário: Testar API cartão de crédito - dados inválidos - Sem país - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto País
    Então visualizo o feedback na caixa de edição "País" com bordas vermelhas 

Cenário: Testar API cartão de crédito - dados inválidos - Sem endereço - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto Endereço
    Então visualizo o feedback na caixa de edição "Endereço" com bordas vermelhas 

Cenário: Testar API cartão de crédito - dados inválidos - Sem cidade - | MELHORIA - CAMPOS PRECISAM ESTAR EM PORTUGUES |
    Dado que acesso a página de "Patrocínio"
    E insiro o valor "10,00"
    E aciono o botão "Debit or Credit Card"
    Quando insiro todos os dados, exceto Cidade
    Então visualizo o feedback na caixa de edição "Cidade" com bordas vermelhas 

