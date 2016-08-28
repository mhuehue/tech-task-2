class RechargePinSection < SitePrism::Section

  element :recharge_pin_text, ".setting-option-details-text"
  element :recharge_pin_edit_btn, "#edit_settings_recharge_pin"
  element :recharge_pin_field, "#my_amaysim2_setting_topup_pw"
  element :error_msg, ".error"

  def reset_recharge_pin
    recharge_pin_edit_btn.click
    recharge_pin_field.set "1234"
    click_on("Save")
  end

end