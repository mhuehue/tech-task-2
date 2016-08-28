Given(/^I am a valid amaysim user$/) do
  #do nothing
end

And(/^my amaysim number is "(.*?)"$/) do |userid|
  @userid = userid
end

And(/^my password is "(.*?)"$/) do |password|
  @password = password
end

Given(/^I am logged in as a valid user$/) do
  @login_page = LoginPage.new
  @login_page.load
  @login_page.log_in_with_creds(@userid, @password)
end