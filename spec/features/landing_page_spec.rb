require 'spec_helper'

require_relative 'site_prism/landing_page'

feature 'Navigate to landing page and click log in' do

  let(:landing_page) { LandingPage.new }
  let(:sign_in_page) { SignInPage.new }

  background do
    landing_page.load
  end

  scenario 'Go to Sign in page' do
    expect(landing_page.login_btn.text).to eq 'Log In'

    landing_page.login_btn.click

    expect(sign_in_page.header.text).to eq 'Sign In'
  end

end
