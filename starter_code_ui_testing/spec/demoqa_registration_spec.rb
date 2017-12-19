require 'spec_helper'

describe 'testing the demoqa registration page' do

  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
  end

  context 'positive paths for the registration form and register' do

    it 'should land on the registration for page' do
      expect(@driver.current_url).to eql('http://demoqa.com/registration/')
    end

    it 'should accept a first name' do
      @driver.set_first_name_field("Nicolas")
    end

    it 'should accept a last name' do
      @driver.last_name_field_displayed
    end

    it 'should accept a marital status selection of Single, Married, or Divorced' do
      @driver.select_marital_option
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
      @driver.select_hobby_option
    end

    it 'should have a country default of Afghanistan' do
      expect(@driver.get_selected_country).to eql("Afghanistan")
    end

    it 'accept a new DOB' do
      @driver.dob_day_list_select('12')
      @driver.dob_month_list_select('5')
      @driver.dob_year_list_select('2013')
    end

    it 'should accept a new email value' do
      @driver.get_email_field_value
    end

    it 'should accept a new country value' do
      @driver.country_dropdown_list_select("Cuba")
    end

    it 'should accept a valid phone number' do
      @driver.get_phone_number_field_value
    end

    it 'should accept a username' do
      @driver.get_user_name_field_value
    end

    it 'should accept a about yourself text' do
      @driver.get_about_yourself_value

    end

    it 'should accept a password' do
      @driver.get_password_value
    end

    it 'should accept a password confirmation' do
      @driver.get_confirmation_password_value
    end

    it 'should click button' do
      @driver.click_submit
    end

    it 'should display registered' do
      @driver.check_registration_successful
    end

  end

end
