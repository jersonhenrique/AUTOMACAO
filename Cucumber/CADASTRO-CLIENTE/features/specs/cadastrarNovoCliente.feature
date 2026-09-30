# language: pt

Funcionalidade: Cadastrar novo cliente
  Acessar o site Automation Practice e validar o cadastro de um novo cliente com sucesso.

  Cenário: cadastrando um novo cliente com sucesso
    Dado que acessei a pagina inicial do sistema
    E que acessei o menu "Sign in"
    Quando na tela Authentication informo os dados de email
    E na tela Authentication clico em "Create an account"
    E na tela Create an Account informo os dados do novo usuario
    E na tela Create an Account clico em "Register"
    Entao na tela My Account sera exibida mensagem "Welcome to your account. Here you can manage all of your personal information and orders"