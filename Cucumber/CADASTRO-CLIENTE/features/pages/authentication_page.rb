module Pages
  class AuthenticationPage < BasePage
    def fill_email
      fill_in 'email_create', with: Faker::Internet.unique.email
    end

    def create_account
      find('#SubmitCreate').click
    end
  end
end
