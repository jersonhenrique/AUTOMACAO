module Pages
  class HomePage < BasePage
    def open
      visit_home
    end

    def open_sign_in
      click_link 'Sign in'
    end
  end
end
