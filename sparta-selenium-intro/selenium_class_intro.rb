require 'selenium-webdriver'

class SeleniumQatoolsForm



  PRACTICE_FORM_URL = 'http://toolsqa.com/automation-practice-form/'
  FIRST_NAME_FIELD_NAME = 'firstname'
  LAST_NAME_FIELD = 'lastname'
  MALE_SEX_RADIO = 'sex-0'
  FEMALE_SEX_RADIO = 'sex-1'
  YEARS_OF_EXPERIENCE = ['exp-0', 'exp-1', 'exp-2', 'exp-3', 'exp-4', 'exp-5']
  DATEPICKER = 'datepicker'
  PROFESSION = 'profession-1'
  CONTINENT = 'continents'
  TOOL = 'tool-2'

  def initialize
    @chrome_driver = Selenium::WebDriver.for :chrome
  end

  def visit_practice_form
    @chrome_driver.get(PRACTICE_FORM_URL)
  end

  def first_name(name)
    @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME).send_keys(name)
  end

  def last_name(lastname)
    @chrome_driver.find_element(:name, LAST_NAME_FIELD).send_keys(lastname)
  end

  def male_radio_button
    @chrome_driver.find_element(:id, MALE_SEX_RADIO).click
  end

  def female_radio_button
    @chrome_driver.find_element(:id, FEMALE_SEX_RADIO).click
  end

  def experience_button
    @chrome_driver.find_element(:id, YEARS_OF_EXPERIENCE[rand(4)]).click
  end

  def datepicker(date)
    @chrome_driver.find_element(:id, DATEPICKER).send_keys(date)
  end

  def profession
    @chrome_driver.find_element(:id, PROFESSION).click
  end

  def tool
    @chrome_driver.find_element(:id, TOOL).click
  end

  def continents
    first = @chrome_driver.find_element(:id, 'continents')
    all_options = first.find_elements(:tag_name, "option")
    all_options.each {|option| if option.text == "North America"; option.click end}
  end

  def get_name
    name = @chrome_driver.find_element(:name, FIRST_NAME_FIELD_NAME).text
    p name

  end



  def sleepy
    sleep 4
  end

end


practice_form_page = SeleniumQatoolsForm.new
practice_form_page.visit_practice_form
practice_form_page.first_name("Nicolas")
practice_form_page.last_name("Rothera")
practice_form_page.male_radio_button
practice_form_page.experience_button
practice_form_page.datepicker('18/12/2017')
practice_form_page.profession
practice_form_page.tool
practice_form_page.continents
p practice_form_page.get_name

practice_form_page.sleepy
