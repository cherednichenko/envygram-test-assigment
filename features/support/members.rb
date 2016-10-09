class Members
   def initialize
      @member_list = {}
      @member_list["QA"] = {
         :email => 'shaft@ukr.net',
         :password => '123456_',
      }
      @member_list["John Doe"] = {
         :email => 'john_doe@com',
         :password => 'some_password_is_here',
      }
   end

   def get(name)
      @member_list[name]
   end
end
