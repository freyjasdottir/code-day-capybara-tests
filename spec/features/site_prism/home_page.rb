class HomePage < SitePrism::Page
  set_url '/home'
  set_url_matcher /localhost:3000\/?/
  
  element :header, '#pageHeader'
  element :acct_btn, 'a[href="/users/edit"]'
  element :timer_btn, 'a[href="/timer"]'
  element :manage_users_btn, 'a[href="/admin/users"]'
  element :manage_clients_btn, 'a[href="/admin/clients"]'
  element :manage_tasks_btn, 'a[href="/admin/tasks"]'
  element :log_out_btn, '.btn.btn-danger'
end