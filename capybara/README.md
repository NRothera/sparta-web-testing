# Capybara

Capybara is a Domain Specific Language. It allows us to use Ruby to interact with elements on a webpage.

Capybara uses Selenium but makes finding and using elements on a webpage even easier. Go to https://gist.github.com/zhengjia/428105 for a list of Capybara commands and how to use them.

# Running Test

cd into capybara, cd into capybara_RSpec_pom. In your terminal run rspec. This will open the bbc homepage and run a variety of tests, such as signing in and signing up.

# Adding Tests

For example, this test for signing in

```
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
```
As you can see, there is a process to signing in, and this test will only pass if every method runs.

There are separate classes for each webpage so make sure you are using the right class methods for the page you are testing.
For instance if you were testing the homepage, you would use @bb_site.bbc_homepage then whichever method you needed for what you were testing.
Usually your tests will involve moving onto different pages so make sure you change your class methods accordingly. In the test above you can see we move from the homepage to the sign in page to the sign up page.

Go to lib, pages for the webpage files containing the methods for each page.
