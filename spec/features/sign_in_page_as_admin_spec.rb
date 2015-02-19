require 'spec_helper'
require_relative 'user_data'

require_relative 'site_prism/sign_in_page'
require_relative 'site_prism/home_page'

feature 'Sign in as admin' do

  let(:page) { SignInPage.new }
  let(:admin) { AdminUser.new }
  let(:invalid_admin) { InvalidAdminUser.new }
  
  before do
    page.load
  end

  scenario 'Sign in as admin user with valid credentials' do
    expect(page.header.text).to eq 'Sign In'
    page.sign_in(admin.user[:username], admin.user[:password])
    expect(current_path).to eq '/home'
    expect(page.header.text).to eq "Home: #{admin.user[:username]}"
    expect(page).to have_content admin.user[:firstname]
  end

  scenario 'Sign in as admin user with invalid credentials' do
    page.sign_in(invalid_admin.user[:username], invalid_admin.user[:password])
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'Sign in as admin user with no username' do
    page.sign_in('', admin.user[:password])
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'Sign in as admin user with no password' do
    page.sign_in(invalid_admin.user[:username], '')
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'Invalid email or password'
  end

end
