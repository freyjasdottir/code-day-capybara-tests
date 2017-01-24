require 'spec_helper'
require_relative 'user_data'

require_relative 'site_prism/sign_in_page'
require_relative 'site_prism/home_page'
require_relative 'site_prism/landing_page'

require 'pry'

feature 'Projects page' do

  let(:sign_in_page) { SignInPage.new }
  let(:home_page) { HomePage.new }
  let(:landing_page) { LandingPage.new }
  let(:admin) { AdminUser.new }

  background do
    sign_in_page.load
    sign_in_page.sign_in(admin.user[:username], admin.user[:password])
  end

  scenario 'Admin can create new projects' do
    home_page.manage_projects_btn.click
    click_link('New Project')
    fill_in 'Name', with: 'Test Project'
    select('something', from: 'project_client_id')
    click_on("Create Project")
    expect(page).to have_content('something')
    expect(page).to have_content('Test Project')
  end
end
