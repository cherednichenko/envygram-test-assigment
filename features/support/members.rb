class Members
   def initialize
      @member_list = {}
      @member_list["QA"] = {
         :email => 'shaft@ukr.net',
         :password => '123456'
      }
   end

   def get(name)
      @member_list[name]
   end
end
