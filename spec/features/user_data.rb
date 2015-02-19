class AdminUser
  attr_reader :user
  def initialize()
    @user = {
              username: 'tester@covermymeds.com',
              password: 'testtest',
              firstname: 'Test_firstname',
              lastname: 'Test_lastname'
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