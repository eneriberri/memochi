class StaticPagesController < ApplicationController
  def index
    if current_user
      redirect_to user_url(current_user.id)
    else
      render :index
    end
  end
end
