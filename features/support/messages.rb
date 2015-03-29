class Messages
  class << self;
    attr_accessor :warnings, :messages
  end

  # -- warning list --
  @warnings = {
  	#login form
    "Required Login" => "Please enter your credentials",

    #sign-up form
    "Required Sign Up" => "Please fill the form"
  }

  # --- message list ----
  @messages = {
    "successful login" => "Successfully logged in"
 }

end
