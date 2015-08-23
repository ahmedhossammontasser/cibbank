class UsersController < ApplicationController
 #before_filter: :companyname 
  
  def requestpassword
    
  end

  def sendrequestpassword
   	  @passwordgenerate =  (0...8).map { (65 + rand(26)).chr }.join

  	  @user = User.find_by_email(params[:email])
  	  @user.password = @passwordgenerate
      @user.password_confirmation = @passwordgenerate
      @user.update_attributes(params[:user])
      if @user 
	      UserRequestPassword.send_request_password(@user,@passwordgenerate).deliver
    	  flash[:success] = "Email Send!"
      	   redirect_to root_path , :success => "Email Send" 
      else
      	flash[:notice] = "Email not found"
      	render :requestpassword
      end	
  end
end