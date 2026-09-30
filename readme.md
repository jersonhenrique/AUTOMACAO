# TESTEAUTOMATION

Projeto de automacao web para testes de regressao usando Cucumber e o padrao Page Object.

## Tecnologias

- Ruby
- Cucumber (BDD)
- Capybara
- Selenium WebDriver
- RSpec Expectations
- Faker
- Allure Report

## Estrutura

A automacao de cadastro de cliente fica em `Cucumber/CADASTRO-CLIENTE`:

- `features/specs`: cenarios em Gherkin
- `features/step_definitions`: ligacao dos passos com o fluxo
- `features/pages`: Page Objects e interacoes com as paginas
- `features/support`: configuracao do Capybara e hooks do Cucumber
- `log`: relatorios HTML e screenshots de cenarios com falha

## Requisitos

- Ruby x64 3.3 ou compativel
- Bundler
- Google Chrome ou Mozilla Firefox

O Selenium Manager gerencia o driver do navegador. Nao e necessario baixar ChromeDriver ou GeckoDriver manualmente.

## Instalacao

No PowerShell, acesse a pasta do projeto e instale as dependencias:

```powershell
cd C:\Users\<usuario>\Documents\AUTOMACAO\Cucumber\CADASTRO-CLIENTE
ruby -v
bundle -v
bundle install
```

## Executar os testes

Execute todos os cenarios:

```powershell
bundle exec cucumber
```

Execute somente o cadastro de cliente:

```powershell
bundle exec cucumber features/specs/cadastrarNovoCliente.feature
```

Gere um relatorio HTML:

```powershell
bundle exec cucumber --format html --out=log/report.html
```

Gere resultados e um relatorio Allure com graficos:

```powershell
bundle exec cucumber -p allure
allure generate allure-results --clean -o allure-report
allure open allure-report
```

O Allure monta automaticamente os graficos de resultados a partir dos cenarios executados. Cada execucao recria `allure-results`; para historico de tendencia entre execucoes, preserve a pasta `history` do relatorio anterior dentro de `allure-results` antes de gerar o proximo relatorio.

## Pipeline GitHub Actions

O workflow `.github/workflows/cucumber-allure.yml` executa os testes em push, pull request ou manualmente. O relatorio Allure e enviado como artefato da execucao, mesmo quando um cenario falha; baixe `allure-report` na pagina da execucao do workflow.

Configure a variavel de repositorio `BASE_URL` nas configuracoes do GitHub Actions para apontar para um ambiente ativo. Sem essa variavel, a pipeline usa a URL padrao documentada acima, que atualmente nao serve a aplicacao de cadastro.

Por padrao, o teste usa Chrome. Selecione outro navegador definindo `BROWSER` antes da execucao:

```powershell
$env:BROWSER = 'firefox'
bundle exec cucumber
```

Valores aceitos: `chrome`, `firefox`, `chrome_headless` e `firefox_headless`.

## URL do sistema

A URL-base pode ser substituida pela variavel `BASE_URL`. O padrao atual e `http://automationpractice.com`:

```powershell
$env:BASE_URL = 'https://<url-do-sistema>'
bundle exec cucumber
```

O fluxo navega para `/index.php?` dentro dessa URL-base; a aplicacao configurada precisa expor essa pagina e os elementos esperados pelos Page Objects.

**Status conhecido:** `automationpractice.com` esta retornando uma pagina de hospedagem da InMotion, nao a aplicacao de cadastro. Portanto, o teste end-to-end precisa de uma URL ativa e compativel para passar.

## Evidencias

Em caso de falha, o hook salva um screenshot em `log/` e o anexa ao relatorio do Cucumber.

## Autor

Jerson Cunha