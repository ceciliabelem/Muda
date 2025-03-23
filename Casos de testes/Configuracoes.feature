Funcionalidade: Configurações

  Cenário: Configurações
    Dado que estou na tela Home Logada
    Quando eu aciono o botão "Minha Conta"
    E aciono o botão "Configurações"
    Então eu devo ver a tela de configurações
    E os seguintes componentes:
        | Componentes |
        | Configurações da Conta |
            | Minhas 12 palavras - Botão "Baixar"|
            | Minha chave privada - Botão "Exportar" |
            | Meu PIN - Botão "Trocar" |
            | Dados KYC - Tooltipo "Saiba mais sobre KYC" - Botão "Adicionar" |

        | Notificações por e-mail |
            | Ativar notificações por e-mail - Interruptor "Ativar" |
            | Notificação de transferência - Interruptor "Ativar" |
            | Notícias mensais sobre a comunidade - Interruptor "Ativar" |


    Cenário: Baixar palavra passe
        Dado que estou na tela de configurações
        E aciono o botão "Baixar palavra passe"
        Então deve iniciar o download do PDF contendo as palavras-passe

    Cenário: Exportar chave privada
        Dado que estou na tela de configurações
        E aciono o botão "Exportar"
        E abre a modal "Exportar chave privada"
        Então visualizo os seguintes componentes:
            | Componentes |
                | Título "Exportar chave privada" |
                | Descrição "Essa é a sua chave privada, que você pode usar para importar sua conta no Simpleos" |
                | Chave privada - Campo de texto - Desabilitado |
                | Botão "Fechar" |
                | Botão "Copiar" |

    Cenário: Trocar PIN
        Dado que estou na tela de configurações
        E aciono o botão "Trocar"
        E abre a modal "Trocar PIN"
        Então visualizo os seguintes componentes:
            | Componentes |
                | Título "Troque seu PIN!" |
                | Descrição "Entre seu novo PIN de segurança com 6 dígitos." |
                | Campo de texto "Novo PIN" |
                | Botão "Mostrar" |
                | Alerta "O texto deve ter exatamente 6 caracteres" |
                | Calculadora de caracteres |
                | Botão "Trocar" |

    Cenário: PIN inválido
        Dado que estou na tela de configurações
        E aciono o botão "Trocar"
        E insiro um PIN inválido
        E aciono o botão "Trocar"
        Então deve ser exibido um alerta "O texto deve ter exatamente 6 caracteres"

    Cenário: Acionar tooltip "Saiba mais sobre KYC"
        Dado que estou na tela de configurações
        E aciono o botão "Saiba mais sobre KYC"
        Então deve ser exibido um tooltip com a descrição "A  verificação KYC é o processo obrigatório de identificação e verificação da identidade do cliente ao abrir uma conta e periodicamente ao longo do tempo. Antes de habilitar este recurso, fale conosco para entender melhor."
    
    Cenário: Adicionar Dados KYC
        Dado que estou na tela de configurações
        E aciono o botão "Adicionar KYC"
        E sou direcionada para a tela "Adicionar Dados KYC"
        Então visualizo os seguintes componentes:
            | Componentes |
                | Título "Adicionar Dados KYC" |
                | Caixa de seleção "Tipo de Documento" com as opções "Numero de segurança social", "Numero Dimex" e "Numero Nite" |
                | Campo de texto "Numero do documento" |
                | Campo de texto "Telefone" |
                | Botão "Salvar" |

    Cenário: Adicionar Dados KYC - Número de documento inválido
        Dado que estou na tela de configurações
        E aciono o botão "Adicionar KYC"
        E insiro um número de documento inválido
        E aciono o botão "Salvar"
        Então deve ser exibido um alerta "Número de documento inválido"

    Cenário: Adicionar Dados KYC - Telefone inválido
        Dado que estou na tela de configurações
        E aciono o botão "Adicionar KYC"
        E insiro um telefone inválido
        E aciono o botão "Salvar"
        Então deve ser exibido um alerta "Telefone inválido"