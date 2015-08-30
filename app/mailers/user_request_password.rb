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

def send_payroll_info_to_bank(user,body )
    @user = user 
    @body = body
      mail( :to => 'a.hossam.2010@gmail.com' ,:subject => 'Payroll info from '+ @user.email ,:body => @body)
   
  end
  
end
    