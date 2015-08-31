class UsersController < ApplicationController
  respond_to :html
before_filter :authenticate_user! , only: [:edit, :update ] 
  
 def edit
  @user = current_user
    respond_with(@user)
  
  end

  def update

    @user = User.find_by_email(params[:user][:email])
    if @user.update_attributes(params[:user])
    flash[:success] = "Profile updated"
    redirect_to root_path
  else
    render 'edit'
  end
  end

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