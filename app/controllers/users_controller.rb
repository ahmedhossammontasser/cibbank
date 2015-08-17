class UsersController < ApplicationController

  def requestpassword
    
  end

  def sendrequestpassword
  	  @user = User.find_by_email(params[:email])
      if @user 
	      UserRequestPassword.send_request_password(@user).deliver
    	  flash[:success] = "Email Send!"
      	   redirect_to root_path , :success => "Email Send" 
      else
      	flash[:notice] = "Email not found"
      	render :requestpassword
      end	
  end

end
