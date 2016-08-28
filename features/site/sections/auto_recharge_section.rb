class AutoRechargeSection < SitePrism::Section

  element :setting_value, ".setting-option-value-text"
  element :setting_detail, ".setting-option-details-text"
  element :edit_btn, "#edit_settings_auto_recharge"
  element :no_radio_btn, "span", text: "No"
  element :error_msg, ".error"

end