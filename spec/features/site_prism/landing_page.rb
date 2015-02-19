class LandingPage < SitePrism::Page
  set_url Capybara.app_host

  element :login_link, "a"
end
