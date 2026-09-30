Dado("que acessei a pagina inicial do sistema") do
  @home_page = Pages::HomePage.new
  @home_page.open
end

Dado("que acessei o menu {string}") do |_menu|
  @home_page.open_sign_in
end

Quando("na tela Authentication informo os dados de email") do
  @authentication_page = Pages::AuthenticationPage.new
  @authentication_page.fill_email
end

Quando("na tela Authentication clico em {string}") do |button_name|
  @authentication_page.create_account if button_name == 'Create an account'
end

Quando("na tela Create an Account informo os dados do novo usuario") do
  @register_page = Pages::RegisterPage.new
  @register_page.complete_form
end

Quando("na tela Create an Account clico em {string}") do |button_name|
  @register_page.register if button_name == 'Register'
end

Entao("na tela My Account sera exibida mensagem {string}") do |mensagem_validacao|
  @my_account_page = Pages::MyAccountPage.new
  expect(@my_account_page.welcome_message).to eq(mensagem_validacao)
end
