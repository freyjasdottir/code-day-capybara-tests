class ClientsPage < SitePrism::Page
  set_url '/admin/clients'

  element :client_table, 'table'
  element :header, '#pageHeader'
  element :new_client_btn, 'a[href="/admin/clients/new"]'
end