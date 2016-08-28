class LoginPage < SitePrism::Page

  set_url "/my-account/my-amaysim/login"

  element :userid_field, "#my_amaysim2_user_session_login"
  element :password_field, "#password"

  def log_in_with_creds(userid, password)
    userid_field.set userid
    password_field.set password
    click_on('Login')
  end

end