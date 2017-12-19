require 'spec_helper'

describe 'Incorrect user details produces valid error' do

  context 'it should respond with the correct error when incorrect details are input' do

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
      @bbc_site.bbc_sign_up_page.select_opt_out
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
      @bbc_site.bbc_sign_up_page.select_opt_out
      @bbc_site.bbc_sign_up_page.click_submit_button
      expect(@bbc_site.bbc_sign_up_page.find_error_message_opt_in).to eql("Something's missing. Please check and try again.")
      sleep 3
    end

  end

end
