class UsersController < ApplicationController
  
  def show
    @user = User.includes(:memos).find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      login(@user)
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render :json => "Ruh roh. Something went wrong."
    end
  end
end
