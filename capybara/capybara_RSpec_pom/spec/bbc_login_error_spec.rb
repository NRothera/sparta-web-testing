require 'spec_helper'

describe 'Incorrect user details produces valid error' do

  context 'it should respond with the correct error when incorrect details are input' do

    after(:all)do
      Capybara.current_session.driver.quit
    end

    it 'should produce an error when inputting an incorrect password to a valid account' do

      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username("dustycheese@yahoo.co.uk")
      @bbc_site.bbc_sign_in_page.fill_in_password('Notreal1')
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.incorrect_password_text).to eql('Uh oh, that password doesn’t match that account. Please try again.')
      sleep 3
    end

    it 'should produce an error when inputting wrong username/email to a valid account' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username("dustycheese@yahoo.com")
      @bbc_site.bbc_sign_in_page.fill_in_password('Sparta123')
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.incorrect_username_text).to eql("Sorry, we can’t find an account with that email. You can register for a new account or get help here.")
      sleep 3
    end

    it 'should produce an error when no username or email in inputted' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username('')
      @bbc_site.bbc_sign_in_page.fill_in_password('Sparta123')
      @bbc_site.bbc_sign_in_page.click_sign_in_button
      expect(@bbc_site.bbc_sign_in_page.incorrect_username_text).to eql("Something's missing. Please check and try again.")
      sleep 3
    end

    it 'should successfully sign in when correct username and password are entered' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.fill_in_username("dustycheese@yahoo.co.uk")
      @bbc_site.bbc_sign_in_page.fill_in_password('Sparta123')
      @bbc_site.bbc_sign_in_page.click_sign_in_button
    end

  end

end
