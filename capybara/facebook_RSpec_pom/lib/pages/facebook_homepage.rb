require 'capybara/dsl'

class FacebookHomepage
  include Capybara::DSL

  HOMEPAGE_URL = 'https://www.facebook.com/'
  FIRSTNAME_FIELD_ID = 'u_0_p'
  LASTNAME_FIELD_ID = 'u_0_r'
  MOBILE_OR_EMAIL_FIELD_ID = 'u_0_u'
  PASSWORD_FIELD_ID = 'u_0_11'
  DAY_ID = 'Day'
  MONTH_ID = 'Month'
  YEAR_ID = 'Year'
  FEMALE_RADIO_ID = 'u_0_b'
  MALE_RADIO_ID = 'u_0_c'
  CREATE_ACCOUNT_BUTTON_ID = 'u_0_17'

  def visit_home_page
    visit(HOMEPAGE_URL)
  end

  def fill_first_name(name)
    fill_in(FIRSTNAME_FIELD_ID, with: name)
  end

  def fill_last_name(name)
    fill_in(LASTNAME_FIELD_ID, with: name)
  end

  def fill_mobile_or_email(string)
    fill_in(MOBILE_OR_EMAIL_FIELD_ID, with: string)
  end

  def fill_passord(password)
    fill_in(PASSWORD_FIELD_ID, with: password)
  end

  


  select('Male', :from => GENDER_SELECT)



end
