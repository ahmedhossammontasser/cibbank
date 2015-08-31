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
           redirect_to root_path , :notice => "Email Send" 
      else
        flash[:notice] = "Email not found"
        render :requestpassword
      end 
  end

  def signoutpath
#      flash[:error] = "Your account is expired. Please contact Navanti for renewal."
        @user = current_user
        @passwordgenerate =  (0...8).map { (65 + rand(26)).chr }.join 
        @user.update_attributes(password: @passwordgenerate , password_confirmation: @passwordgenerate) 
        sign_out :user if user_signed_in?
        redirect_to root_path, notice: "Signed out successfully."  
    end

end