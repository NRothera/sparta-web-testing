# Selenium Web Testing Automation

To run the tests, cd into starter_code_ui_tesing and run rspec in the terminal. This will open http://demoqa.com/registration/ and start filling in the form.

Go to https://gist.github.com/huangzhichong/3284966 for examples of how to search for elements on a web page using Selenium

# Adding Tests

Go to the spec folder and open demoqa_registration_spec.rb

UI testing requires you to be on the web page in order to tests the elements on it, make sure
 ```
  before(:all) do
    @driver = SeleniumDemoReg.new
    @driver.access_registration_form
  end
  ```

  is at the top of the spec folder. This will open the web page before the testing begins.

  Go to selenium_demoqa_registration.rb  to view the methods for the demoqa webpage.

  Use those to forumalate your tests
  e.g.
  ```
  it 'should accept a marital status selection of Single, Married, or Divorced' do
    @driver.select_marital_option
  end
  ```
  You do not need to use expect for most tests as the tests will pass as long as they can run
