class UsersPage < SitePrism::Page
  set_url '/admin/users'

  element :users_table, 'table'
  element :header, '#pageHeader'
  element :new_users_btn, 'a[href="/admin/users/new"]'
  def show_btns
    find_all('a', :text => 'Show')
  end
end