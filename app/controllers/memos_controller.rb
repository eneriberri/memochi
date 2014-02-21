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
      redirect_to :new
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
  
end
