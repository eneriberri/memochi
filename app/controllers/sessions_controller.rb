class SessionsController < ApplicationController  
  def new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user])
    
    if @user.nil?
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    else
      login(@user)
      redirect_to @user
    end
    
  end
  
  def destroy
    logout_current_user!
    redirect_to root_url
  end
end
