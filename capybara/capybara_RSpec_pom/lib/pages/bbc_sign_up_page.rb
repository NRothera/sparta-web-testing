require 'capybara/dsl'

class BbcSignUpPage
  include Capybara::DSL

  SIGN_UP_PAGE_URL = 'https://account.bbc.com/register?context=homepage&nonce=BPKPLZ26-i9mME5H7jm7emYl4MjhC6H43-eo&ptrt=https%3A%2F%2Fwww.bbc.co.uk%2F&userOrigin=homepage'
  DAY_INPUT_FIELD = 'day-input'
  MONTH_INPUT_FIELD = 'month-input'
  YEAR_INPUT_FIELD = 'year-input'
  SUBMIT_BUTTON = 'submit-button'
  EMAIL_FIELD = 'user-identifier-input'
  PASSWORD_FIELD = 'password-input'
  POSTCODE_FIELD = 'postcode-input'
  GENDER_SELECT = 'gender-input'
  OPT_OUT_EMAIL = 'button__text-wrapper'
  OPT_IN_ERROR_MESSAGE_ID = 'form-message-marketingOptIn'
  SAME_EMAIL_ERROR_ID = 'form-message-email'
  GENDER_MESSAGE_ERROR_ID = 'form-message-gender'
  PASSWORD_MESSAGE_ERROR_ID = 'form-message-password'
  DOB_ERROR_MESSAGE_ID = 'form-message-dateOfBirth'



  def fill_day_field(day)
    fill_in(DAY_INPUT_FIELD, with: day)
  end

  def fill_month_field(month)
    fill_in(MONTH_INPUT_FIELD, with: month)
  end

  def fill_year_field(year)
    fill_in(YEAR_INPUT_FIELD, with: year)
  end

  def click_submit_button
    click_button(SUBMIT_BUTTON)
  end

  def fill_email_field(email)
    fill_in(EMAIL_FIELD, with: email)
  end

  def fill_password_field(password)
    fill_in(PASSWORD_FIELD, with: password)
  end

  def fill_postcode_field(postcode)
    fill_in(POSTCODE_FIELD, with: postcode)
  end

  def choose_gender
    select('Male', :from => GENDER_SELECT)
  end

  def select_opt(opt)
    find(:xpath, ".//label[@for='#{opt}']/div/div").click
  end

  def find_error_message_opt_in
    find(:id, OPT_IN_ERROR_MESSAGE_ID).text
  end

  def find_error_user_text
    find(:id, SAME_EMAIL_ERROR_ID).text
  end

  def find_error_gender_text
    find(:id, GENDER_MESSAGE_ERROR_ID).text
  end

  def find_error_password_text
    find(:id, PASSWORD_MESSAGE_ERROR_ID).text
  end

  def find_dob_error_message_text
    find(:id, DOB_ERROR_MESSAGE_ID).text
  end
end
