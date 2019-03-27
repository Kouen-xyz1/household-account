class ProfitController < ApplicationController
  before_action :require_login
  def index
    @profits = Profit.where(user_id: current_user.id)
  end
  
  def new
  end

  def edit
    @profit = Profit.find_by(id: params[:id])
    redirect_to :profit_index_path and return unless @profit
  end

  def update
    @profit = Profit.find_by(id: params[:id])
    redirect_to :profit_index_path and return unless @profit
    @profit.update(profit_params)
    redirect_to action: :index and return
  end

  def create
    Profit.create(
      user_id: current_user.id,
      category: params[:category],
      sub_category1: params[:sub_category1],
      sub_category2: params[:sub_category2],
      year_2019_01: params[:year_2019_01],
      year_2019_02: params[:year_2019_02],
      year_2019_03: params[:year_2019_03]
      )
    redirect_to action: :index and return
  end  

  def profit_params
    params.require(:profit).permit(:user_id, :category, :sub_category1, :sub_category2, :year_2019_01, :year_2019_02, :year_2019_03)
  end
end
