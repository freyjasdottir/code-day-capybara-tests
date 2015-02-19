require 'spec_helper'
require_relative 'user_data'

require_relative 'site_prism/sign_in_page'
require_relative 'site_prism/home_page'

feature 'Admin home page links' do

  let(:sign_in_page) { SignInPage.new }
  let(:home_page) { HomePage.new }
  let(:admin) { AdminUser.new }
  
  background do
    sign_in_page.load
    sign_in_page.sign_in(admin.user[:username], admin.user[:password])
  end

  scenario 'Logged in admin user' do
    expect(home_page).to be_displayed
    expect(home_page.header.text).to eq "Home: #{admin.user[:username]}"
    expect(home_page).to have_content admin.user[:firstname]
    expect(home_page).to have_acct_btn
    expect(home_page).to have_timer_btn
    expect(home_page).to have_manage_users_btn
    expect(home_page).to have_manage_clients_btn
    expect(home_page).to have_manage_tasks_btn
    expect(home_page).to have_manage_projects_btn
    expect(home_page).to have_log_out_btn
  end
end
