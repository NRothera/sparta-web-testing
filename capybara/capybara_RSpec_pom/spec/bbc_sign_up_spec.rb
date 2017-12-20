require 'spec_helper'

describe 'Incorrect user details produces valid error' do

  context 'it should respond with the correct error when incorrect details are input' do

    after(:all)do
      Capybara.current_session.driver.quit
    end

    after(:each) do
      @bbc_site = BbcSite.new

    end

    it 'should tell you you have entered an incorrect date of birth' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_sign_up_page.click_submit_button
      expect(@bbc_site.bbc_sign_up_page.find_dob_error_message_text).to eql("Oops, that date doesn't look right. Make sure it's a real date written as DD-MM-YYYY e.g. the 5th of June 2009 is 05-06-2009.")
    end


    it 'should successfully sign in when correct username and password are entered' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_sign_up_page.fill_day_field(10)
      @bbc_site.bbc_sign_up_page.fill_month_field(10)
      @bbc_site.bbc_sign_up_page.fill_year_field(1992)
      @bbc_site.bbc_sign_up_page.click_submit_button
      @bbc_site.bbc_sign_up_page.fill_email_field("fakemail@gmail.com")
      @bbc_site.bbc_sign_up_page.fill_password_field("Secretpassword1")
      @bbc_site.bbc_sign_up_page.fill_postcode_field("PE84EJ")
      @bbc_site.bbc_sign_up_page.choose_gender
      @bbc_site.bbc_sign_up_page.select_opt('optOut')
      @bbc_site.bbc_sign_up_page.click_submit_button
      sleep 3
    end

    it "should fail when you don't select opt in or out" do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_sign_up_page.fill_day_field(10)
      @bbc_site.bbc_sign_up_page.fill_month_field(10)
      @bbc_site.bbc_sign_up_page.fill_year_field(1992)
      @bbc_site.bbc_sign_up_page.click_submit_button
      @bbc_site.bbc_sign_up_page.fill_email_field("dustycheese@yahoo.co.uk")
      @bbc_site.bbc_sign_up_page.fill_password_field("Secretpassword1")
      @bbc_site.bbc_sign_up_page.fill_postcode_field("PE84EJ")
      @bbc_site.bbc_sign_up_page.choose_gender
      @bbc_site.bbc_sign_up_page.click_submit_button
      expect(@bbc_site.bbc_sign_up_page.find_error_message_opt_in).to eql("Something's missing. Please check and try again.")
      sleep 5
    end

    it 'should tell you that the user email already exists' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_sign_up_page.fill_day_field(10)
      @bbc_site.bbc_sign_up_page.fill_month_field(10)
      @bbc_site.bbc_sign_up_page.fill_year_field(1992)
      @bbc_site.bbc_sign_up_page.click_submit_button
      @bbc_site.bbc_sign_up_page.fill_email_field("dustycheese@yahoo.co.uk")
      @bbc_site.bbc_sign_up_page.fill_password_field("Secretpassword1")
      @bbc_site.bbc_sign_up_page.fill_postcode_field("PE84EJ")
      @bbc_site.bbc_sign_up_page.choose_gender
      @bbc_site.bbc_sign_up_page.select_opt('optOut')
      @bbc_site.bbc_sign_up_page.click_submit_button
      expect(@bbc_site.bbc_sign_up_page.find_error_user_text).to eql("Looks like you’ve already registered with this email. Want to sign in?")
    end

    it 'should fail and tell you something is missing if you do not choose a gender' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_sign_up_page.fill_day_field(10)
      @bbc_site.bbc_sign_up_page.fill_month_field(10)
      @bbc_site.bbc_sign_up_page.fill_year_field(1992)
      @bbc_site.bbc_sign_up_page.click_submit_button
      @bbc_site.bbc_sign_up_page.fill_email_field("dustycheese@yahoo.co.uk")
      @bbc_site.bbc_sign_up_page.fill_password_field("Secretpassword1")
      @bbc_site.bbc_sign_up_page.fill_postcode_field("PE84EJ")
      @bbc_site.bbc_sign_up_page.select_opt('optOut')
      @bbc_site.bbc_sign_up_page.click_submit_button
      expect(@bbc_site.bbc_sign_up_page.find_error_gender_text).to eql("Something's missing. Please check and try again.")
    end

    it 'should fail and tell you to enter something that is not a letter into password' do
      @bbc_site = BbcSite.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.click_register_link
      @bbc_site.bbc_sign_up_page.fill_day_field(10)
      @bbc_site.bbc_sign_up_page.fill_month_field(10)
      @bbc_site.bbc_sign_up_page.fill_year_field(1992)
      @bbc_site.bbc_sign_up_page.click_submit_button
      @bbc_site.bbc_sign_up_page.fill_email_field("dustycheese@yahoo.co.uk")
      @bbc_site.bbc_sign_up_page.fill_password_field("Secretpassword")
      @bbc_site.bbc_sign_up_page.fill_postcode_field("PE84EJ")
      @bbc_site.bbc_sign_up_page.select_opt('optOut')
      @bbc_site.bbc_sign_up_page.click_submit_button
      expect(@bbc_site.bbc_sign_up_page.find_error_password_text).to eql("Sorry, that password isn't valid. Please include something that isn't a letter.")
    end
  end

end
