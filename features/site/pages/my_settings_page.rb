class MySettingsPage < SitePrism::Page

  set_url "/my-account/my-amaysim/settings"

  section :sim_nickname_section, SimNicknameSection, "#settings_sim_nickname"
  section :recharge_pin_section, RechargePinSection, "#settings_recharge_pin"
  element :caller_id_section, "#settings_caller_id_out"
  element :call_waiting_section, "#settings_caller_waiting"
  element :voicemail_section, "#settings_voice_mail"
  element :usage_alerts_section, "#settings_usage_alert"
  element :intl_roaming_section, "#settings_intl_roaming"
  element :checkbox, "label"
  element :info_modal, ".form_info_popup"
  element :modal_bg , ".reveal-modal-bg"
  element :confirm_modal, ".confirm-modal"
  element :confirm_modal_yes_btn, "#confirm_popup_yes"
  section :call_forwarding_section, CallForwardingSection, "#settings_call_forwarding"
  section :premium_sms_limit_section, PremiumSmsLimitSection, "#settings_premium_sms_limit"
  section :auto_recharge_section, AutoRechargeSection, "#settings_auto_recharge"

  def is_checkbox_checked?(section)

    within(section) do
      @checkbox_status = find('input[type="checkbox"]')[:checked]
    end

    if @checkbox_status.nil?
      @checkbox_status = false
    end

    if @checkbox_status.to_s.include? "true"
      @checkbox_status = true
    end

    return @checkbox_status
  end

end