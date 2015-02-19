require 'spec_helper'
require_relative 'user_data'

require_relative 'site_prism/sign_in_page'
require_relative 'site_prism/home_page'

feature 'Sign in as admin' do

  let(:sign_in_page) { SignInPage.new }
  let(:home_page) { HomePage.new }
  let(:admin) { AdminUser.new }
  let(:invalid_admin) { InvalidAdminUser.new }
  
  background do
    sign_in_page.load
  end

  scenario 'Sign in as admin user with valid credentials' do
    expect(sign_in_page.header.text).to eq 'Sign In'
    
    sign_in_page.sign_in(admin.user[:username], admin.user[:password])
    
    expect(home_page).to be_displayed
    expect(home_page.header.text).to eq "Home: #{admin.user[:username]}"
  end

  scenario 'Sign in as admin user with invalid credentials' do
    sign_in_page.sign_in(invalid_admin.user[:username], invalid_admin.user[:password])
    expect(sign_in_page).to be_displayed
    expect(sign_in_page).to have_content 'Invalid email or password'
  end

  scenario 'Sign in as admin user with no username' do
    sign_in_page.sign_in('', admin.user[:password])
    expect(sign_in_page).to be_displayed
    expect(sign_in_page).to have_content 'Invalid email or password'
  end

  scenario 'Sign in as admin user with no password' do
    sign_in_page.sign_in(invalid_admin.user[:username], '')
    expect(sign_in_page).to be_displayed
    expect(sign_in_page).to have_content 'Invalid email or password'
  end
end
