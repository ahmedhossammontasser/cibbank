class UserRequestPassword < ActionMailer::Base
  default from: "from@example.com"
  def send_request_password(user,passwordgenerate)
    @user = user
    @passwordgenerate = passwordgenerate
    @bodymessage =    "Thanks for signing up" , @user.email ,"\n",'Your new Password  : ' , @passwordgenerate 
    mail( :to => @user.email,:subject => 'Your New Password ',:body =>  @bodymessage )
  end
end
    