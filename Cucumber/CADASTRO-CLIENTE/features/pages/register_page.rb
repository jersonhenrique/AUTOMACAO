module Pages
  class RegisterPage < BasePage
    def complete_form
      find('#id_gender2').click
      fill_in 'customer_firstname', with: Faker::Name.first_name
      fill_in 'customer_lastname', with: Faker::Name.last_name
      fill_in 'passwd', with: 'Teste@123'
      select '3', from: 'days'
      select 'March', from: 'months'
      select '1990', from: 'years'
      check 'newsletter'
      check 'optin'
      fill_in 'company', with: Faker::Company.name
      fill_in 'address1', with: Faker::Address.street_address
      fill_in 'address2', with: Faker::Address.secondary_address
      fill_in 'city', with: Faker::Address.city
      select 'Washington', from: 'id_state'
      fill_in 'postcode', with: '10001'
      fill_in 'other', with: Faker::Lorem.sentence
      fill_in 'phone', with: Faker::PhoneNumber.phone_number
      fill_in 'phone_mobile', with: Faker::PhoneNumber.cell_phone
      fill_in 'alias', with: 'Minha Casa'
    end

    def register
      click_button 'Register'
    end
  end
end
