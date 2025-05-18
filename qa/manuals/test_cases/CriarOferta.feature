Funcionalidade: Criar Oferta

  Como um usuário do sistema
  Eu quero criar uma nova oferta
  Para que eu possa disponibilizar produtos para venda

    @regressivo @funcional @critico @smoke
    Cenário: Criar uma nova oferta com sucesso
        Passo 1 de 4 - 
            Dado que eu estou na página de criação de oferta - Passo 1 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
            E visualizo os campos:
                | Título "Passo 1 de 4" |
                | Caixa de edição "Nome" (do produto) |
                | Caixa de texto "Descrição" (do produto) |
                | Botão "Cancelar" |
                | Botão "Continuar" |
            Quando preencho o campo "Nome" com o nome "Aulas de Programação"
            E eu preencho o campo "Descrição" com "Descrição das aulas de programação"
            E eu formato o texto conforme for necessário
            E eu clico no botão "Continuar"
            Então sou direcionada para o Passo 2 de 4



        Passo 2 de 4 - 
            Dado que eu estou na página de criação de oferta - Adicionar de imagem do produto
            E visualizo:
                | Título "Passo 2 de 4" |
                | Texto descritivo "Adicione imagens do produto. Você pode adicionar mais imagens mais tarde." |
                | Botão "Adicionar imagem" |
                | Botão "Cancelar" |
                | Botão "Continuar" |
            Quando eu clico no botão "Adicionar imagem"
            E eu seleciono a imagem "imagem.png"
            E eu clico no botão "Continuar"
            Então sou direcionada para o Passo 3 de 4

        Passo 3 de 4 - 
            Dado que eu estou na página de criação de oferta - Categorias
            E visualizo:
            | Título: Passo 3 de 4 |
            | Título: Categorias |
            | Texto descritivo: "Você pode selecionar uma ou mais categorias para ajudar usuários a achar este produto" |
            |Localidade
                Rio de Janeiro - RJ
                Nova Friburgo - RJ
                Goiânia - GO
                Anápolis - GO
                Regência - ES
                Florianópolis - SC
                Belo Horizonte - MG
                Virtual
            Produtos
                Roupas
                Calçados
                Livros
                Objetos
                Cosméticos
                Cds e discos
                Acessórios
                Plantas
                Alimentos
                    Frescos
                    Secos
                    Bebidas
            Serviços
                Pintura
                Música
                Gastronomia
                Tatuagem
                Designer
                Carpintaria
                Jardinagem
                Fotografia
                Agroecológicos
                Tradução e revisão
                Terapias
                    Reiki
                Consultoria
                Aulas
                    Idiomas
                    Danças
                    Yoga
                Tarot
                Compostagem
                Hospedagem
            Eventos |
            | Botão "Cancelar" |
            | Botão "Continuar" |
            Quando eu seleciono a categoria "Aulas"
            E eu clico no botão "Continuar"
            Então sou direcionada para o Passo 4 de 4 - Preço e inventário

        Passo 4 de 4 - Preço e inventário
            Dado que eu estou na página de criação de oferta - Preço e inventário
            E visualizo:
                | Título: Passo 4 de 4 |
                | Título: Preço e inventário |
                | Caixa de edição "Preço" |
                | Interruptor "Gerenciamento de inventário" |
                    | Texto descritivo: "Se você quer desabilitar sua oferta quando não tiver mais unidades em estoque, habilite esta opção"
                    | Botão "menos" |
                    | Caixa de edição "Quantidade em estoque" |
                    | botão "mais" |
                | Botão "Cancelar" |
                | Botão "Criar" |
            Quando eu preencho o campo "Preço" com o valor "100" Muda
            E eu preencho o campo "Quantidade" com o valor "10"
            E eu clico no botão "Criar oferta"
            E insiro o "Pin" de 6 dígitos
            Então sou direcionada para a página de visualização da oferta
            E notificação "Oferta criada com sucesso!"
            E Botão "Fechar" são exibidos

    @regressivo @funcional @critico
    Cenário: Editar oferta criada
        Dado que estou na página de visualização da oferta (https://muda.cambiatus.io/shop/257)
        E visualizo:
            | Botão "Voltar" |
            | Título: "Aulas de Programação" |
            | Imagem do produto |
            | Título: "Aulas de Programação" |
            | Texto descritivo: "Descrição das aulas de programação" |
            | Categorias:
                | Aulas |
                | Serviço |
            | Texto "Escolha a quantidade" |
            | Botão "menos" |
            | Caixa de edição "Quantidade" |
            | Botão "mais" |
            | Texto "100 Preço (muda)" |
            | Texto "Você possui 186 MUDA" |
            | Caixa de texto "Comentário (opcional)" |
            | Botão "Editar oferta" |
        Então aciono o botão "Editar oferta"
        E é aberta a modal "Editar oferta"
        E visualizo:
            | Título: "Editar oferta" |
            | Botão "Fechar" |
            | Botão "Informações principais"
            | Botão "Imagens" |
            | Botão "Categorias" |
            | Botão "Preço e inventário" |
            | Botão "Excluir" |
        E aciono o botão "Informações principais"
        Então sou direcionada para a página de edição de oferta - Passo 1 de 4

         Dado que estou na página de visualização da oferta (https://muda.cambiatus.io/shop/257)
         E aciono o botão "Editar oferta"
         E é aberta a modal "Editar oferta"
         Quando aciono o botão "Imagens"
         Então sou direcionada para a página de edição de oferta - Passo 2 de 4

        Dado que estou na página de visualização da oferta (https://muda.cambiatus.io/shop/257)
        E aciono o botão "Editar oferta"
        E é aberta a modal "Editar oferta"
        E aciono o botão "Categorias"
        Então sou direcionada para a página de edição de oferta - Passo 3 de 4

        Dado que estou na página de visualização da oferta (https://muda.cambiatus.io/shop/257)
        E aciono o botão "Editar oferta"
        E é aberta a modal "Editar oferta"
        E aciono o botão "Preço e inventário"
        Então sou direcionada para a página de edição de oferta - Passo 4 de 4

    @regressivo @funcional @critico
    Cenário: Apagar oferta criada - exclusão com sucesso

        Dado que estou na página de visualização da oferta (https://muda.cambiatus.io/shop/257)
        E aciono o botão "Editar oferta"
        E é aberta a modal "Editar oferta"
        Quando aciono o botão "Excluir"
        E é aberta a modal "Excluir"
        E visualizo:
            | Título: "Excluir" |
            | Botão	"Fechar" |
            | Texto: "Você tem certeza que deseja excluir este item?" |
            | Botão "Não" |
            | Botão "Sim" |
        E aciono o botão "Sim"
        Então sou direcionada para a página "Ofertas"

    @regressivo @funcional @nao-bloqueante
    Cenário: Apagar oferta criada - desistencia de exclusão
        Dado que estou na página de visualização da oferta (https://muda.cambiatus.io/shop/257)
        E aciono o botão "Editar oferta"
        E é aberta a modal "Editar oferta"
        Quando aciono o botão "Excluir"
        E é aberta a modal "Excluir"
        E aciono o botão "Não"
        Entao sou direcionada para a modal "Editar oferta"


Passo 1 - 
    @regressivo @funcional @critico
    Cenário: Nome da oferta vazio
        Dado que estou na página de criação de oferta - Passo 1 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        Quando não preencho o campo "Nome" 
        E eu preencho o campo "Descrição" com "Descrição das aulas de programação"
        E eu formato o texto conforme for necessário
        E eu clico no botão "Continuar"
        Então recebo o feedback "O texto deve ter mais de 3 caracteres"
        E as bordas da caixa de edição ficam vermelhas

    @regressivo @funcional @critico
    Cenário: Descrição da oferta vazio
        Dado que estou na página de criação de oferta - Passo 1 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        E eu preencho o campo "Nome" com o nome "Aulas de Programação"
        Quando não preencho o campo "Descrição" 
        E eu clico no botão "Continuar"
        Então recebo o feedback "O texto deve ter mais de 10 caracteres"
        E as bordas da caixa de texto ficam vermelhas

    @regressivo @funcional @critico
    Cenário: Nome da oferta com mais de 478 caracteres
        Dado que estou na página de criação de oferta - Passo 1 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        E eu preencho o campo "Nome" com o nome "AEm uma tarde silenciosa de outono, enquanto o vento soprava suavemente pelas janelas entreabertas da antiga casa de madeira, Marina sentou-se na poltrona favorita da avó com uma xícara de chá de camomila entre as mãos. As folhas douradas dançavam lá fora.Um vento uivante"
        E eu preencho o campo "Descrição" com "Descrição das aulas de programação"
        E eu formato o texto conforme for necessário
        E aciono o botão "Continuar"
        Então os caracteres que excederem 478 não devem ser inseridos

    @regressivo @funcional @critico
    Cenário: Descrição da oferta com mais de 500 caracteres - |CAMPO SEM LIMITE DE CARACTERES|
        Dado que estou na página de criação de oferta - Passo 1 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        E eu preencho o campo "Nome" "Aulas de Programação"
        E eu preencho o campo "Descrição" com um texto aleatório de 40000 caracteres
        E eu formato o texto conforme for necessário
        E aciono o botão "Continuar"
        Então os caracteres que excederem 478 não devem ser inseridos

    @regressivo @funcional @critico
    Cenário: DEscrição da oferta com menos de 10 caracteres
        Dado que estou na página de criação de oferta - Passo 1 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        E eu preencho o campo "Nome" "Aulas de Programação"
        Quando não preencho o campo "Descrição" 
        E eu clico no botão "Continuar"
        Então recebo o feedback "O texto deve ter mais de 10 caracteres"
        E as bordas da caixa de texto ficam vermelhas

    @regressivo @funcional @critico
    Cenário: Nome da oferta com menos de 4 caracteres
        Dado que estou na página de criação de oferta - Passo 1 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        E eu preencho o campo "Nome" com o nome "A"
        E eu preencho o campo "Descrição" com "Descrição das aulas de programação"
        E eu formato o texto conforme for necessário
        E eu clico no botão "Continuar"
        Então recebo o feedback "O texto deve ter mais de 4 caracteres"
        E as bordas da caixa de edição ficam vermelhas

    @regressivo @funcional @nao-bloqueante
    Cenário: Cancelar criação de oferta durante o fluxo
        
        Dado que estou na página de criação de oferta - Passo 1 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        E eu preencho o campo "Nome" com o nome "Aulas de Programação"
        E eu preencho o campo "Descrição" com "Descrição das aulas de programação"
        E eu formato o texto conforme for necessário
        Quando aciono o botão "Cancelar"
        Então sou direcionada para a página inicial de ofertas (https://muda.cambiatus.io/shop)


Passo 2 - 
    @regressivo @funcional @nao-bloqueante
    Cenário: Adicionar mais de uma imagem
        Dado que estou na página de criação de oferta - Passo 2 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
         E eu clico no botão "Adicionar imagem"
        E eu seleciono a imagem "imagem.png"
        E aciono "Abrir"
        Quando eu clico no botão "Adicionar imagem"
        E eu seleciono a imagem "imagem2.png"
        Então visualizo as duas imagens na tela de edição

    @regressivo @funcional @nao-bloqueante
    Cenário: Desistir de anexar imagem
        Dado que estou na página de criação de oferta - Passo 2 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)E eu clico no botão "Adicionar imagem"
        E eu seleciono a imagem "imagem.png"
        Quando aciono "Cancelar"
        Então não visualizo a imagem na tela de edição
        E o botão "Continuar" deve estar habilitado

    @regressivo @funcional @nao-bloqueante
    Cenário: Editar imagem
        
        Dado que estou na página de criação de oferta - Passo 2 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        E eu clico no botão "Adicionar imagem"
        E eu seleciono a imagem "imagem.png"
        E aciono "Abrir"
        Quando eu clico na imagem
        Então sou direcionada para a tela de edição da imagem

    
    @regressivo @funcional @nao-bloqueante
    Cenário: Apagar imagem
        Dado que estou na página de criação de oferta - Passo 2 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        E eu clico no botão "Adicionar imagem"
        E eu seleciono a imagem "imagem.png"
        E aciono "Abrir"
        Quando eu aciono o botão "Excluir"
        Então a imagem não deve ser exibida na tela de edição
        E o botão continuar deve estar habilitado

    @regressivo @funcional @nao-bloqueante
    Cenário: Não selecionar categoria | MELHORIA - NÃO PERMITIR CATEGORIA VAZIA |
        Dado que estou na página de criação de oferta - Passo 3 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        Quando não seleciono nenhuma categoria
        E eu clico no botão "Continuar"
        Então sou direcionada ao Passo 4 de 4 - Preço e inventário

    @regressivo @funcional @nao-bloqueante
    Cenário: Selecionar todas as categorias | MELHORIA - NÃO PERMITIR TODAS AS CATEGORIAS |
        Dado que estou na página de criação de oferta - Passo 3 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        E eu seleciono todas as categorias
        E eu clico no botão "Continuar"
        Então sou direcionada ao Passo 4 de 4 - Preço e inventário

Passo 4
    @regressivo @funcional @critico
    Cenário: Preço 0 | MELHORIA - OFERTA POR 0 MUDA? |
        Dado que estou na página de criação de oferta - Passo 4 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        E eu preencho o campo "Preço" com o valor "0"
        E eu preencho o campo "Quantidade" com o valor "10"
        E eu clico no botão "Criar oferta"
        Então recebo o feedback "O número deve ser maior do que 0"
        E as bordas da caixa de edição ficam vermelhas

    @regressivo @funcional @critico
    Cenário: Preço 999.999.999.999.999.999 - QUINTILHÃO | Melhoria - feedback para o usuário sobre valor máximo |
        Dado que estou na página de criação de oferta - Passo 4 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        E eu preencho o campo "Preço" com o valor "999.999.999.999.999.999"
        E eu preencho o campo "Quantidade" com o valor "999.999.999.999.999.999.999"
        E eu clico no botão "Criar oferta"
        Então o valor é substituído por "1" - reiniciando o campo

    @regressivo @funcional @critico
    Cenário: Criar oferta sem inventário:
        Dado que estou na página de criação de oferta - Passo 4 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        E eu preencho o campo "Preço" com o valor "100"
        Quando eu desativo o interruptor "Gerenciamento de inventário"
        E eu clico no botão "Criar oferta"
        Então sou direcionada para a página de visualização da oferta
        E notificação "Oferta criada com sucesso!"

    @regressivo @funcional @critico
    Cenário: Criar oferta com estoque -1
        Dado que estou na página de criação de oferta - Passo 4 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        E eu preencho o campo "Preço" com o valor "100"
        Quando eu preencho o campo "Quantidade" com o valor "-1"
        Então recebo o feedback "O número deve ser maior do que 0"
        E as bordas da caixa de edição ficam vermelhas

    @regressivo @funcional @critico
    Cenário: Criar oferta com estoque de 63 algarismos
        Dado que estou na página de criação de oferta - Passo 4 de 4 (https://muda.cambiatus.io/shop/new/sell?step=mainInformation)
        E eu preencho o campo "Preço" com o valor "100"
        Quando eu preencho o campo "Quantidade" com o valor "cinquenta novendecilhões" - 63 algarismos 
        Então a caixa de texto impede a inserção de valor após 62 algarismos


