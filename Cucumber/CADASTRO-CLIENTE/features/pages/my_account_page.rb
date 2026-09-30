module Pages
  class MyAccountPage < BasePage
    def welcome_message
      find('p.info-account').text
    end
  end
end
