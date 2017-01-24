class LandingPage < SitePrism::Page
  set_url '/'

  def login_btn
    find('a', :text => 'Log In')
  end
end
