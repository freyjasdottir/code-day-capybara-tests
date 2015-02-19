require 'spec_helper'

require_relative 'site_prism/landing_page'

feature 'Navigate to landing page and click log in' do

  let(:page) { LandingPage.new }

  before do
    page.load
  end

  scenario 'Go to login page' do
    expect(page.login_link.text).to eq 'Log In'

    page.login_link.click
    
    expect(current_path).to eq '/users/sign_in'
  end

end
