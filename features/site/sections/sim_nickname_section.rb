class SimNicknameSection < SitePrism::Section

  element :sim_nickname_text, ".setting-option-details-text"
  element :sim_nickname_edit_btn, "#edit_settings_phone_label"
  element :sim_nickname_field, "#my_amaysim2_setting_phone_label"
  element :error_msg, ".error"

  def reset_sim_nickname
    sim_nickname_edit_btn.click
    sim_nickname_field.set "Default Nickname"
    click_on("Save")
  end

end