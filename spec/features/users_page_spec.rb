require 'spec_helper'
require_relative 'user_data'

require_relative 'site_prism/sign_in_page'
require_relative 'site_prism/home_page'
require_relative 'site_prism/users_page'


feature 'Users page links' do
  let(:sign_in_page) { SignInPage.new }
  let(:home_page) { HomePage.new }
  let(:users_page) { UsersPage.new }
  let(:admin) { AdminUser.new }

  background do
    sign_in_page.load
    sign_in_page.sign_in(admin.user[:username], admin.user[:password])
    home_page.manage_users_btn.click
  end

  scenario 'Crud links exist on page' do
    expect(users_page.show_btns.first).to be_visible
  end

  scenario 'Admins can create new users' do
    users_page.new_users_btn.click
    fill_in 'First name', with: 'Judy'
    fill_in 'Last name', with: 'Jetson'
    fill_in 'Email', with: 'judy@ssprockets.org'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on("Create User")
    expect(page).to have_content('Jetson', :visible => true)
  end


end
