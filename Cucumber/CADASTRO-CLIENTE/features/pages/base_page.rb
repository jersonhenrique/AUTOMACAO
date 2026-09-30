module Pages
  class BasePage
    include Capybara::DSL

    def visit_home
      visit '/index.php?'
    end
  end
end
