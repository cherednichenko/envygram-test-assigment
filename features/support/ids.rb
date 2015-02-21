class IDs
  class << self;
    attr_accessor :buttons, :login_link, :login_form, :forgot_link, :forgot_form
    attr_accessor :login_warning_pass, :login_warning_email, :sign_up, :sign_up_with_email
    attr_accessor :sign_up_warning_email, :sign_up_warning_pass, :dropdown_create_post_open
    attr_accessor :text_boxes, :password, :sign_up_form, :success, :user, :dropdown_create_post
    attr_accessor :headline, :media_combo, :image_from_internet, :source, :save_source
    attr_accessor :select_adType, :description, :check_created_post, :email_or_username
  end

  # -- Main --
  @login_link = 'loginDialogButton'
  @sign_up_with_email = ".//*[@id='joinEnvygram']/div/div[2]/div/span[6]/a"

  # -- Login --
  @login_form = ".//*[@id='loginDialog']/div[1]/h4"
  @forgot_link = "forgotDialogButton"
  @login_warning_pass = "UserLogin_password_em_"
  @login_warning_email = "UserLogin_email_em_"
  @email_or_username = "UserLogin_email"
  @password = "UserLogin_password"

  # -- Forgot --
  @forgot_form = ".//*[@id='userForgotDialog']/div[1]/h4"

  # -- Activation dialog --
  @success = ".//*[@id='activationDialog']/div[1]/h4"

  # -- Sign up --
  @sign_up = ".//*[@id='UserRegister']/div[3]/button"
  @sign_up_form = ".//*[@id='registerDialog']/div/div/div[1]/h4"
  @sign_up_warning_email = 'UserRegister_email_em_'
  @sign_up_warning_pass = 'UserRegister_password_em_'

  # -- Home --
  @user = ".//*[@id='yw13']/li[2]/a/div/div[2]"
  @dropdown_create_post = ".//*[@id='yw13']/li[1]/a"
  @dropdown_create_post_open = ".//*[@id='yw14']/li[1]/a"

  # -- Create a post form --
  @headline = ".//*[@name='PostCreate[header]']"
  @media_combo = ".//*[@id='PostCreate']/div[1]/div[2]/div/div[2]/div[1]/a[1]"
  @image_from_internet = ".//*[@id='yw1']/li[1]/a"
  @source = ".//*[@id='upload-from-website-form']//div//input"
  @save_source = ".//*[@id='uploadFromWebsiteDialog']/div[3]/a[1]"
  @select_adType = ".//*[@id='PostCreate_adType']/option[3]"
  @description = ".//*[@name='PostCreate[description]']"
  @check_created_post = ".//*[@id='content']/div[1]/div/div/a/span"

  # -- Authentications --
  @text_boxes = {
    'username' => 'UserRegister_username',
    'email' => 'UserRegister_email',
    'password' => 'UserRegister_password'
  }

  # -- buttons list --
  @buttons = {
      "Join Envygram" => "joinEnvygramBtn",
      "Sign in" => "signIn",
      "Join Envygram" => "joinEnvygramBtn",
      "Create Envygram" => "createNewPost"
  }
end
