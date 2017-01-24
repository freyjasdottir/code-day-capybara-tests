require 'spec_helper'
require_relative 'user_data'

require_relative 'site_prism/sign_in_page'
require_relative 'site_prism/home_page'
require_relative 'site_prism/clients_page'

require 'pry'

feature 'Clients page links' do

  let(:sign_in_page) { SignInPage.new }
  let(:home_page) { HomePage.new }
  let(:clients_page) { ClientsPage.new }
  let(:admin) { AdminUser.new }

  background do
    sign_in_page.load
    sign_in_page.sign_in(admin.user[:username], admin.user[:password])
    home_page.manage_clients_btn.click
  end

  scenario 'Logged in admin user' do
    clients_page.wait_for_client_table
    expect(clients_page.header.text).to eq "Clients"
    expect(clients_page).to have_new_client_btn
  end

  scenario 'Admin can create a new client' do
    clients_page.wait_for_new_client_btn
    clients_page.new_client_btn.click
    fill_in 'Company name', with: 'Spacely Sprockets'
    #binding.pry
    create_client_button = find_button('Create Client')
    create_client_button.click
    clients_page.wait_for_client_table
    expect(clients_page).to have_content('Spacely Sprockets')
  end

end
