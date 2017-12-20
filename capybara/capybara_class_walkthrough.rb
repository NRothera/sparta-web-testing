require 'capybara/dsl'

class BbcHomepage

  HOMEPAGE   = 'https://www.bbc.co.uk/'

  SIGN_IN_LINK_ID = '#idcta-link'
  EMAIL_USERNAME_FIELD = 'user-identifier-input'
  PASSWORD_FIELD = 'password-input'
  SUBMIT_BUTTON = "submit-button"

  def initialize

    Capybara.register_driver :chrome do |app|

      Capybara::Selenium::Driver.new(app, :browser => :chrome)

    end
    @driver = Capybara::Session.new(:chrome)
  end

  def visit_home_page
    @driver.visit(HOMEPAGE)
  end

  def sign_in
    @driver.find(SIGN_IN_LINK_ID).click
    sleep 1
  end

  def fill_in_email_username
    @driver.fill_in(EMAIL_USERNAME_FIELD, with: "nickrothera@gmail.com")
  end

  def fill_in_password
    @driver.fill_in(PASSWORD_FIELD, with: "Sparta123")
  end

  def submit
    @driver.find_button(SUBMIT_BUTTON).click
    sleep 1
  end



end
something = BbcHomepage.new
something.visit_home_page
something.sign_in
something.fill_in_email_username
something.password
something.submit
