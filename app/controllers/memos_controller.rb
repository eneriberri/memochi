class MemosController < ApplicationController
  before_filter :require_current_user, :except => [:index]
  
  def index
    @memos = Memo.all
  end
  
  def new
    render :new
  end
  
  def show
    @memo = Memo.find(params[:id])
  end
  
  def create
    @memo = Memo.new(params[:memo])
    
    if @memo.save
      redirect_to memo_url(@memo)
    else
      flash.now[:errors] = @memo.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @memo = Memo.find(params[:id])
    if @memo && @memo.user_id == current_user.id
      @memo.destroy 
      redirect_to :index
    else
      flash.now[:errors] = @memo.errors.full_messages
      render :index
    end
  end
  
  def edit
    @memo = Memo.find(params[:id])
    render :edit
  end
  
  def update
    @memo = Memo.find(params[:id])
    
    if @memo.update_attributes(params[:memo])
      render :show
    else
      render :json => "uh oh"
    end
      
  end
  
  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    
    redirect_to user_url(current_user)
  end
  
end
