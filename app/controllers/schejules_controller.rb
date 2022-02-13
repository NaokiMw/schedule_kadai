class SchejulesController < ApplicationController
  def index
    @schejules = Schejule.all
  end
  def new
    @schejule = Schejule.new
  end
  def create
    @schejule = Schejule.new(params.require(:schejule).permit(:title, :startdate, :enddate, :allday, :memo))
    
    if @schejule.save
      flash[:notice] = "スケジュールを登録しました!"
      redirect_to :schejules
    else
      render "new"
    end
  end

  
  def show
    @schejule = Schejule.find(params[:id])
  end

  def edit
    @schejule = Schejule.find(params[:id])
  end

  def update
    @schejule = Schejule.find(params[:id])
      if @schejule.update(params.require(:schejule).permit(:title, :startdate, :enddate, :allday, :memo))
        flash[:notice] = "IDが「#{@schejule.id}」の情報を更新しました"
        redirect_to :schejules
      else
        render "edit"
      end
  end

  def destroy
    @schejule = Schejule.find(params[:id])
      @schejule.destroy
      flash[:notice] = "スケジュールを削除しました"
      redirect_to :schejules
  end
end
