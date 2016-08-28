class PremiumSmsLimitSection < SitePrism::Section

  element :setting_value, ".setting-option-value-text"
  element :edit_btn, "#edit_settings_premium_sms_limit"

end