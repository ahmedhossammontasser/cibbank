class UserRequestPassword < ActionMailer::Base
  default from: "from@example.com"
  def send_request_password(user)
    @user = user
    mail( :to => @user.email,:subject => 'Your New Password' )
  end
end
