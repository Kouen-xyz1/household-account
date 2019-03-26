class ProfitController < ApplicationController
  before_action :require_login
  def index
    @profits = Profit.where(user_id: current_user.id)
  end
  
  def new
  end

  def create
    Budget.create(
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
end
