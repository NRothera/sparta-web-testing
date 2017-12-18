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
      expect(@driver.select_marital_option).to be_truthy
    end

    it 'should have a country default of Afhghanistan' do
      expect(@driver.country_dropdown_list_select).to be_falsy
    end

    it 'accept a new DOB' do

    end

    it 'should accept a new country value' do

    end

    it 'should accept a valid phone number' do
      expect(@driver.get_phone_number_field_value).to be_truthy
    end

    it 'should accept a username' do
      expect(@driver.get_user_name_field_value).to be_truthy
    end

    it 'should accept a about yourself text' do

    end

    it 'should accept a password' do

    end

    it 'should accept a password confirmation' do

    end

  end

end
