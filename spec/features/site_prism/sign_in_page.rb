class SignInPage < SitePrism::Page
  set_url '/users/sign_in'
  
  element :header, '#pageHeader'
  element :username_field, 'input#user_email'
  element :password_field, 'input#user_password'
  element :submit_button, 'input[name="commit"]'

  def sign_in(username, password)
    username_field.set(username)
    password_field.set(password)
    submit_button.click
  end
end

