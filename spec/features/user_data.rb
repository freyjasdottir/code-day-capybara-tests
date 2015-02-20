class User
  attr_reader :user
  def initialize()
    @user = {
              username: 'tester@covermymeds.com',
              password: 'testtest',
              firstname: 'tester',
              lastname: 'user'
            }
  end    
end

class AdminUser
  attr_reader :user
  def initialize()
    @user = {
              username: 'admin@admin.com',
              password: '00000000',
              firstname: 'admin',
              lastname: 'admin'
            }
  end    
end

class InvalidAdminUser
  attr_reader :user
  def initialize()
    @user = {
              username: 'invalidtester@covermymeds.com',
              password: 'badpassword',
              firstname: 'Invalid_firstname',
              lastname: 'Invalid_lastname'
            }
  end    
end