# QA - Quality Assurance

Este diretório contém todos os recursos relacionados à garantia de qualidade do projeto. Ele está organizado em diferentes categorias para facilitar a navegação e o uso.

## Estrutura do Diretório

- `manuals/`: Contém casos de teste manuais e massas de dados necessárias para execução.
  - `test_cases/`: Casos de teste manuais descritos em formato Gherkin ou documentos.
  - `massas de teste/`: Arquivos de suporte, como planilhas ou documentos.

- `automation/`: Scripts e configurações para testes automatizados.
  - `scripts/`: Scripts de automação (ex.: Robot Framework).
  - `bugs/`: Relatórios de bugs e testes funcionais identificados manualmente.
  - `reports/`: Relatórios de execução de testes (ainda em desenvolvimento).

- `accessibility/`: Relatórios e ferramentas para testes de acessibilidade.
  - `reports/`: Relatórios gerados por ferramentas como Axe ou Lighthouse.

- `indicators/`: Arquivos de indicadores de acessibilidade e métricas.
  - `KPIs_Acessibilidade_Cecilia.xlsx`: Planilha para acompanhamento dos KPIs de acessibilidade (ainda em branco).

- `tests/`: Testes executados, resultados e relatórios.

## Como Usar

### Testes Manuais
1. Navegue até a pasta `manuals/test_cases`.
2. Siga os casos de teste descritos para validar funcionalidades manualmente.

### Automação
1. Navegue até a pasta `automation/scripts`.
2. Execute os scripts de automação usando a ferramenta configurada (ex.: Robot Framework).
   - Para rodar os testes automatizados, abra o terminal e execute:
     ```bash
     robot <nome_do_arquivo.robot>
     ```

### Acessibilidade
1. Navegue até a pasta `accessibility/reports`.
2. Revise os relatórios gerados para identificar problemas de acessibilidade.

## Contribuindo

Certifique-se de seguir as diretrizes do projeto ao adicionar novos casos de teste ou scripts. Mantenha a estrutura organizada e atualize este README conforme necessário.
