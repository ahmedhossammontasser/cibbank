class UserRequestPassword < ActionMailer::Base
  default from: "from@example.com"
  
  def send_request_password(user)
    @user = user

    mail( :to => @user.email,:subject => 'Your New Password ' )
  end

  def send_payroll_info_value_day(user)
  	@user = user 
	  	mail( :to => @user.email ,:subject => 'Payroll  Value Date ' )
	 
  end

end
    