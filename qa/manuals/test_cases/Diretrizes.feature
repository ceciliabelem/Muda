Funcionalidade: Diretrizes

@regressivo @funcional @critico @smoke
Cenário: Ler as diretrizes Diretrizes
    Dado que acesso o link de convite https://muda.cambiatus.io/register/Pzz98P
    E me cadastro
    E recebo as palavras chave "bico rica viatura pomba esfumado boletim viveiro forjar lacre avulso vaidoso oportuno"
    E marco o checkbox "Copiei e colei em um local seguro as 12 palavras que Cambiatus pediu 💜"
    E Aciono o botão "Criar minha conta"
    E sou direcionada para a tela de inserção de palavras chave
    E insiro as palavras chave "bico rica viatura pomba esfumado boletim viveiro forjar lacre avulso vaidoso oportuno"
    E aciono o botão "Continuar"
    E insiro um novo pin de 6 dígitos "147258"
    E confirmo o novo pin de 6 dígitos "147258"
    E aciono o botão "Entrar"
    E visualizo a modal "Diretrizes" com os seguintes componentes:
        | Título - Diretrizes da comunidade e Código de conduta 1.0 |
        | Texto - 
            Todas as comunidades digitais criadas usando o webapp Cambiatus são regidas pelas Diretrizes da comunidade e Código de conduta da Cambiatus.
            Para que você continue tendo uma boa experiência com a comunidade, recomendamos que leia nossas Diretrizes e Código de conduta. |
        | Link Ler Diretrizes da comunidade e Código de conduta 1.0 da Cambiatus - https://www.cambiatus.com/pt-br/codigo-de-conduta |
        | Botão "Aceito" |
        | Botão "Não aceito" |
    Quando aciono o link "Ler Diretrizes da comunidade e Código de conduta 1.0 da Cambiatus"
    Então sou direcionada para a página "Diretrizes da comunidade e Código de conduta 1.0 da Cambiatus" - https://www.cambiatus.com/pt-br/codigo-de-conduta

@regressivo @funcional @critico
Cenário: Não aceitar as diretrizes
    Dado que acesso o link de convite https://muda.cambiatus.io/register/Pzz98P
    E me cadastro
    E recebo as palavras chave "bico rica viatura pomba esfumado boletim viveiro forjar lacre avulso vaidoso oportuno"
    E marco o checkbox "Copiei e colei em um local seguro as 12 palavras que Cambiatus pediu 💜"
    E Aciono o botão "Criar minha conta"
    E sou direcionada para a tela de inserção de palavras chave
    E insiro as palavras chave "bico rica viatura pomba esfumado boletim viveiro forjar lacre avulso vaidoso oportuno"
    E aciono o botão "Continuar"
    E insiro um novo pin de 6 dígitos "147258"
    E confirmo o novo pin de 6 dígitos "147258"
    E aciono o botão "Entrar"
    E visualizo a modal "Diretrizes"
    Quando aciono o botão "Não aceito"
    E o texto é alterado para:
        | Texto - 
            ** EM VERMELHO** Atenção: O não aceite das Diretrizes da comunidade e Código de conduta impede que você realize atividades dentro da comunidade, como comprar, vender, transferir, convidar amigos, etc. **EM VERMELHO** |
        | Texto -
            Para que você pertença e desfrute de todas as atividades que envolvem a comunidade, você deve aceitar as Diretrizes da comunidade e Código de conduta 1.0.
            Tem certeza que deseja não aceitar? |
    E aciono o botão "Não aceito"
    Então sou direcionada para a home congelada

@regressivo @funcional @critico
Cenário: Aceitar as diretrizes
    Dado que acesso o link de convite https://muda.cambiatus.io/register/Pzz98P
    E me cadastro
    E recebo as palavras chave "bico rica viatura pomba esfumado boletim viveiro forjar lacre avulso vaidoso oportuno"
    E marco o checkbox "Copiei e colei em um local seguro as 12 palavras que Cambiatus pediu 💜"
    E Aciono o botão "Criar minha conta"
    E sou direcionada para a tela de inserção de palavras chave
    E insiro as palavras chave "bico rica viatura pomba esfumado boletim viveiro forjar lacre avulso vaidoso oportuno"
    E aciono o botão "Continuar"
    E insiro um novo pin de 6 dígitos "147258"
    E confirmo o novo pin de 6 dígitos "147258"
    E aciono o botão "Entrar"
    E visualizo a modal "Diretrizes"
    Quando aciono o botão "Aceito"
    Então sou direcionada para o painel da home logada Muda com todas as funcionalidades ativas - https://muda.cambiatus.io/dashboard