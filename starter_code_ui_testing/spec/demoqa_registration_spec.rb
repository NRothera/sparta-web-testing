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
      expect(@driver.set_first_name_field("Nicolas")).to be_truthy
    end

    it 'should accept a last name' do
      expect(@driver.last_name_field_displayed).to be_truthy
    end

    it 'should accept a marital status selection of Single, Married, or Divorced' do
      expect(@driver.select_marital_option).to be_truthy
    end

    it 'should accept a hobby status selection of Dance, Reading, or Cricket' do
      expect(@driver.select_hobby_option).to be_truthy
    end

    it 'should have a country default of Afghanistan' do
      expect(@driver.get_selected_country).to eql("Afghanistan")
    end

    it 'accept a new DOB' do
      expect(@driver.dob_day_list_select(12)).to be_truthy
      expect(@driver.dob_month_list_select(5)).to be_truthy
      expect(@driver.dob_year_list_select(2018)).to be_truthy
    end

    it 'should accept a new email value' do
      expect(@driver.get_email_field_value).to be_truthy
    end

    it 'should accept a new country value' do
      expect(@driver.country_dropdown_list_select("Cuba")).to be_truthy
    end

    it 'should accept a valid phone number' do
      expect(@driver.get_phone_number_field_value).to be_truthy
    end

    it 'should accept a username' do
      expect(@driver.get_user_name_field_value).to be_truthy
    end

    it 'should accept a about yourself text' do
      expect(@driver.get_about_yourself_value).to be_truthy

    end

    it 'should accept a password' do
      expect(@driver.get_password_value).to be_truthy
    end

    it 'should accept a password confirmation' do
      expect(@driver.get_confirmation_password_value).to be_truthy
    end

    it 'should click button' do
      @driver.click_submit
    end

  end

end
