

Dado("que acessei a pagina inicial do sistema") do                                                 
  @driver.get 'http://automationpractice.com/index.php?' 
            
end                                                                                            
                                                                                               
Dado("que acessei o menu {string}") do |string|                                
   @driver.find_element(:link_text, 'Sign in').click

end                                                                                            
                                                                                               
Quando("na tela Authentication informo os dados de email") do                              
  @driver.find_element(:id, "email_create").send_keys(Faker::Internet.email)
end                                                                                            
                                                                                               
Quando("na tela Authentication clico em Create an Account") do                                 
  @driver.find_element(:xpath, "(.//*[normalize-space(text()) 
  and normalize-space(.)='Email address'])[1]/following::span[1]").click                 
end                                                                                            
                                                                                               
Quando("na tela CREAT AN ACCOUNT informo os dados do novo usuario") do                         
  @driver.find_element(:id, "id_gender2").click
  @driver.find_element(:id, "customer_firstname").clear
  @driver.find_element(:id, "customer_firstname").send_keys(Faker::Name.first_name)
  @driver.find_element(:id, "customer_lastname").clear
  @driver.find_element(:id, "customer_lastname").send_keys(Faker::Name.last_name)
  @driver.find_element(:id, "passwd").clear
  @driver.find_element(:id, "passwd").send_keys(Faker::Internet.password)
  @driver.find_element(:id, "days").click
  @driver.find_element(:id, "newsletter").click
  @driver.find_element(:id, "optin").click
  @driver.find_element(:id, "firstname").click
  @driver.find_element(:xpath, "(.//*[normalize-space(text()) 
  and normalize-space(.)='Your address'])[1]/following::p[1]").click
  @driver.find_element(:id, "lastname").click
  @driver.find_element(:xpath, "(.//*[normalize-space(text()) 
  and normalize-space(.)='*'])[5]/following::p[1]").click
  @driver.find_element(:id, "company").clear
  @driver.find_element(:id, "company").send_keys(Faker::Company.name)
  @driver.find_element(:id, "address1").clear
  @driver.find_element(:id, "address1").send_keys(Faker::Name.name)
  @driver.find_element(:id, "address2").clear
  @driver.find_element(:id, "address2").send_keys(Faker::Name.name)
  @driver.find_element(:id, "city").clear
  @driver.find_element(:id, "city").send_keys(Faker::Name.name)
  @driver.find_element(:id, "id_state").click
  Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "id_state"))
  .select_by(:text, "Washington")
  @driver.find_element(:id, "postcode").clear
  @driver.find_element(:id, "postcode").send_keys(Faker::Number.number(5))
  @driver.find_element(:id, "id_country").click
  @driver.find_element(:xpath, "(.//*[normalize-space(text()) 
  and normalize-space(.)='Receive special offers from our partners!'])[1]/following::div[1]").click
  @driver.find_element(:id, "other").clear
  @driver.find_element(:id, "other").send_keys(Faker::Name.name)
  @driver.find_element(:id, "phone").clear
  @driver.find_element(:id, "phone").send_keys(Faker::Number.number(11))
  @driver.find_element(:id, "phone_mobile").clear
  @driver.find_element(:id, "phone_mobile").send_keys(Faker::Number.number(11))
  @driver.find_element(:id, "center_column").click
  @driver.find_element(:id, "alias").clear
  @driver.find_element(:id, "alias").send_keys(Faker::Name.name)
end                                                                                            
                                                                                               
Quando("na tela CREAT AN ACCOUNT clico em Register") do                                        
  @driver.find_element(:xpath, "(.//*[normalize-space(text()) 
  and normalize-space(.)='DNI / NIF / NIE'])[1]/following::span[1]").click
end                                                                                            
                                                                                               
Entao("na tela MY ACCOUNT sera exibida mensagem {string}") do |mensagemValidacao| 
  @mensagemValidacao = @driver.find_element(:css, "p.info-account")
  "Welcome to your account. Here you can manage all of your personal information and orders."
  .eql? @mensagemValidacao.text
end