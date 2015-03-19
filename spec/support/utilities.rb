
def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
  else
    visit root_path 
    find('#login').click
    find('#session_email').set(user.email.upcase)
    find('#session_password').set(user.password)
    click_button "Sign in"
  end
end
