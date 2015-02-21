class Messages
  class << self;
    attr_accessor :warnings, :messages
  end

  # -- warning list --
  @warnings = {
  	#login form
    "Required" => "Please enter your credentials",

    #sign-up form
    "Required" => "Please fill the form"
  }

  # --- message list ----
  @messages = {
    "successful login" => "Successfully logged in"
 }

end
