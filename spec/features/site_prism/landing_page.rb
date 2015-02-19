class LandingPage < SitePrism::Page
  set_url '/'
  set_url_matcher /localhost:3000\/?/

  element :login_link, "a"
end
