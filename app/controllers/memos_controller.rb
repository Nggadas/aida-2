class MemosController < ApplicationController
  before_action :require_user
  before_action :set_memo, only: [:show, :edit, :update, :destroy]

  

  def index
    @memos = current_user.memos.all
  end

  
  
  def show
  end

  
  def new
    @memo = current_user.memos.new
  end

  
  def edit
  end

  
  
  def create
    @memo = current_user.memos.new(memo_params)

    respond_to do |format|
      if @memo.save
        format.html { redirect_to @memo, notice: 'Memo was successfully created.' }
        format.json { render :show, status: :created, location: @memo }
      else
        format.html { render :new }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  
  
  def update
    respond_to do |format|
      if @memo.update(memo_params)
        format.html { redirect_to @memo, notice: 'Memo was successfully updated.' }
        format.json { render :show, status: :ok, location: @memo }
      else
        format.html { render :edit }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  
  
  def destroy
    @memo.destroy
    respond_to do |format|
      format.html { redirect_to memos_url, notice: 'Memo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_memo
      @memo = current_user.memos.find(params[:id])
    end

    
    def memo_params
      params.require(:memo).permit(:title, :content, :user_id)
    end
end
