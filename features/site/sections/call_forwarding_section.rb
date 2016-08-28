class CallForwardingSection < SitePrism::Section

  element :setting_value, ".setting-option-value-text"
  element :setting_detail, ".setting-option-details-text"
  element :edit_btn, "#edit_settings_call_forwarding"
  element :phone_number_field, "input#my_amaysim2_setting_call_divert_number"
  element :no_radio_btn, "span", text: "No"
  element :error_msg, ".error"

end