# QA - Quality Assurance

Este diretório contém todos os recursos relacionados à garantia de qualidade do projeto Muda-frontend. A estrutura foi padronizada para facilitar a navegação, manutenção e automação dos testes.

## Estrutura do Diretório

- `manuals/`: Casos de teste manuais e massas de dados auxiliares.
  - `test_cases/`: Casos de teste manuais em formato Gherkin ou documentos.
  - `Massa_de_testes/`: Arquivos de suporte, como planilhas ou documentos.

- `automation/`: Testes automatizados com Robot Framework.
  - `login.robot`: Cenários automatizados de login (positivos e negativos), utilizando keywords customizadas e massas centralizadas.
  - `resources/`: Recursos compartilhados para automação.
    - `keywords.robot`: Keywords customizadas baseadas em SeleniumLibrary, robustas para múltiplos idiomas e validação de erro por componente.
    - `massas.robot`: Centralização das massas de teste utilizadas nos cenários.

- `accessibility/`: Relatórios e ferramentas para testes de acessibilidade.
  - `reports/`: Relatórios gerados por ferramentas como Axe ou Lighthouse.

- `indicators/`: Arquivos de indicadores de acessibilidade e métricas.
  - `KPIs_Acessibilidade_Cecilia.xlsx`: Planilha para acompanhamento dos KPIs de acessibilidade.

## Como Usar

### Testes Manuais
1. Navegue até a pasta `manuals/test_cases`.
2. Siga os casos de teste descritos para validar funcionalidades manualmente.

### Automação (Robot Framework)
1. Navegue até a pasta `automation`.
2. Certifique-se de ter o Python, Robot Framework e SeleniumLibrary instalados.
3. Execute os testes com o comando:
   ```bash
   robot login.robot
   ```
   ou para rodar todos os testes:
   ```bash
   robot .
   ```
4. Os resultados serão gerados em `automation/report.html` e `automation/output.xml`.

### Acessibilidade
1. Navegue até a pasta `accessibility/reports`.
2. Revise os relatórios gerados para identificar problemas de acessibilidade.

## Contribuindo

- Siga as diretrizes do projeto ao adicionar novos casos de teste ou scripts.
- Utilize as keywords e massas centralizadas para garantir padronização e manutenção facilitada.
- Mantenha a estrutura organizada e atualize este README sempre que necessário.