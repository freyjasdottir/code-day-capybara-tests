class LandingPage < SitePrism::Page
  set_url '/'
  set_url_matcher /localhost:3000\/?/

  def login_btn
    find('a', :text => 'Log In')
  end
end
