require 'spec_helper'

require_relative 'site_prism/landing_page'

feature 'Navigate to landing page and click log in' do

  let(:sign_in_page) { LandingPage.new }

  background do
    sign_in_page.load
  end

  scenario 'Go to Sign in page' do
    expect(sign_in_page.login_link.text).to eq 'Log In'

    sign_in_page.login_link.click
    
    expect(sign_in_page).to be_displayed
  end

end
