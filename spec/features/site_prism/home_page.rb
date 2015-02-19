class HomePage < SitePrism::Page
  set_url Capybara.app_host + '/home'
  
  element :header, '#pageHeader'
end