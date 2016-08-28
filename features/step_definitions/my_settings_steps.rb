When(/^I navigate to "(.*?)" page$/) do |nav_link_text|
  @nav = MyAccountLhsNav.new
  @nav.navigate_to(nav_link_text)
end

And(/^I click on the edit button for SIM Nickname$/) do
  @my_settings_page = MySettingsPage.new
  @current_section = @my_settings_page.sim_nickname_section
  @current_section.sim_nickname_edit_btn.click
end

And(/^I enter "(.*?)" as the SIM Nickname$/) do |nickname|
  @current_section.sim_nickname_field.set nickname
end

And(/^I click on the save button/) do
  click_on('Save')
end

Then(/^the SIM Nickname is updated to "(.*?)" successfully$/) do |nickname|
  expect(@current_section.sim_nickname_text.text).to eq(nickname)
end

Then(/^I should see validation message as "(.*?)"$/) do |error_msg|
  @current_section.wait_until_error_msg_visible
  expect(@current_section.error_msg.text).to eq(error_msg)
end

When(/^I click on the edit button for recharge PIN$/) do
  @my_settings_page = MySettingsPage.new
  @current_section = @my_settings_page.recharge_pin_section
  @current_section.recharge_pin_edit_btn.click
end

When(/^I enter "([^"]*)" as the recharge PIN$/) do |recharge_pin|
  @current_section.recharge_pin_field.set recharge_pin
end

Then(/^the recharge PIN is updated to "([^"]*)" successfully$/) do |recharge_pin|
  expect(@current_section.recharge_pin_text.text).to eq(recharge_pin)
end

Then(/^the caller ID should be disabled$/) do
  @my_settings_page = MySettingsPage.new
  @current_section = @my_settings_page.caller_id_section
  expect(@my_settings_page.is_checkbox_checked?(@current_section)).to be(false)
end

Then(/^the call waiting should be disabled$/) do
  @my_settings_page = MySettingsPage.new
  @current_section = @my_settings_page.call_waiting_section
  expect(@my_settings_page.is_checkbox_checked?(@current_section)).to be(false)
end

Then(/^the voicemail should be disabled$/) do
  @my_settings_page = MySettingsPage.new
  @current_section = @my_settings_page.voicemail_section
  expect(@my_settings_page.is_checkbox_checked?(@current_section)).to be(false)
end

When(/^I click on the checkbox$/) do
  within(@current_section) do
    @my_settings_page.checkbox.click
  end
end

Then(/^I should see the successful confirmation message$/) do
  @my_settings_page.wait_until_info_modal_visible(20)
  expect(@my_settings_page.info_modal.text).to have_content("Success")
end

When(/^I close the modal pop\-up$/) do
  @my_settings_page.modal_bg.click
  @my_settings_page.wait_until_info_modal_invisible
end

Then(/^the checkbox is ticked$/) do
  expect(@my_settings_page.is_checkbox_checked?(@current_section)).to be(true)
end

Then(/^the checkbox is unticked$/) do
  expect(@my_settings_page.is_checkbox_checked?(@current_section)).to be(false)
end

Then(/^the usage alerts should be disabled$/) do
  @my_settings_page = MySettingsPage.new
  @current_section = @my_settings_page.usage_alerts_section
  expect(@my_settings_page.is_checkbox_checked?(@current_section)).to be(false)
end

Then(/^I should see the confirmation modal$/) do
  @my_settings_page.wait_until_confirm_modal_visible
  #to be refactored, clicking on yes button is unstable
  sleep 2
  expect(@my_settings_page.confirm_modal.text).to have_content("Yes")
end

Then(/^I click on yes$/) do
  @my_settings_page.wait_until_confirm_modal_yes_btn_visible
  @my_settings_page.confirm_modal_yes_btn.click
end

Then(/^the international roaming should be disabled$/) do
  @my_settings_page = MySettingsPage.new
  @current_section = @my_settings_page.intl_roaming_section
  expect(@my_settings_page.is_checkbox_checked?(@current_section)).to be(false)
end

Then(/^the call forwarding should be disabled$/) do
  @my_settings_page = MySettingsPage.new
  @current_section = @my_settings_page.call_forwarding_section
  expect(@current_section.setting_value.text).to eq("No")
end

When(/^I click on the edit button for call forwarding$/) do
  @current_section.edit_btn.click
end

Then(/^I should see the call forwarding confirmation modal$/) do
  expect(@my_settings_page.confirm_modal.text).to have_content("Confirm")
end

When(/^I click on confirm$/) do
  page.execute_script(%Q{$("#scrollElement").prop("scrollTop", 1000000).trigger('scroll')})
  click_on("Confirm")
end

When(/^I enter "([^"]*)" as the phone number$/) do |phone_number|
  @current_section.phone_number_field.set phone_number
end

Then(/^I should see the call forwarding has been successfully set up to number "([^"]*)"$/) do |phone_number|
  expect(@current_section.setting_value.text).to eq("Yes")
  expect(@current_section.setting_detail.text).to have_content(phone_number)
end

When(/^I click on the No radio button$/) do
  @current_section.no_radio_btn.click
end

Then(/^the premium SMS limit should be disabled$/) do
  @my_settings_page = MySettingsPage.new
  @current_section = @my_settings_page.premium_sms_limit_section
  expect(@current_section.setting_value.text).to eq("No")
end

Then(/^I click on the edit button for premium SMS limit$/) do
  @current_section.edit_btn.click
end

Then(/^I select "([^"]*)" as the limit$/) do |limit|
  select(limit, :from => 'my_amaysim2_setting[psms_spend]')
end

Then(/^I should see the new limit is set to "([^"]*)"$/) do |limit|
  expect(@current_section.setting_value.text).to eq(limit)
end

Then(/^the auto recharge should be disabled$/) do
  @my_settings_page = MySettingsPage.new
  @current_section = @my_settings_page.auto_recharge_section
  expect(@current_section.setting_value.text).to eq("No")
end

Then(/^I click on the edit button for auto recharge$/) do
  @current_section.edit_btn.click
end

Then(/^I should see the auto recharge is set to "([^"]*)"$/) do |auto_recharge_detail|
  expect(@current_section.setting_value.text).to eq("Yes")
  expect(@current_section.setting_detail.text).to have_content(auto_recharge_detail)
end