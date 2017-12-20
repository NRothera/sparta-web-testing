require 'capybara'

Capybara.register_driver :chrome do |app|

  Capybara::Selenium::Driver.new(app, :browser => :chrome)

end

session = Capybara::Session.new(:chrome)

session.visit('http://toolsqa.com/automation-practice-form/')

session.fill_in('firstname', with: 'test')
session.fill_in('lastname', with: 'success')

session.choose('sex-0')
session.choose('exp-4')
session.fill_in('datepicker', with: '22/12/2017')
session.find(:css, '#profession-0').click
session.select('Europe', from: "continents")
session.select('Navigation Commands', from: "selenium_commands")
sleep 2
