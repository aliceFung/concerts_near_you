module LoginMacros

  def sign_in(**args)
    visit root_path
    click_link "Log In"
    user=create(:user)
    user.password = "password"
    fill_in "Email", with: user.email || args[:email]
    fill_in "user_password", with: user.password || args[:password]
    click_button "Log In"
  end

  def sign_up(**args)
    visit root_path
    click_link "Sign Up"
    user=create(:user)
    user.password = "password"
    fill_in "user_email", with: user.email || args[:email]
    fill_in "user_password", with: user.password || args[:password]
    fill_in "user_password_confirmation", with: user.password || args[:password]
    click_button "Sign Up"
  end

end