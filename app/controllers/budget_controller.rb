class BudgetController < ApplicationController
  before_action :require_login
  def index
    @budgets = Budget.where(user_id: current_user.id)
  end
  
  def new
  end
  
  def edit
    @budget = Budget.find_by(id: params[:id])
    redirect_to :budget_index_path and return unless @budget
  end

  def update
    @budget = Budget.find_by(id: params[:id])
    redirect_to :budget_index_path and return unless @budget
    @budget.update(budget_params)
    redirect_to action: :index and return
  end

  def create
    Budget.create(
      user_id: current_user.id,
      category: params[:category],
      sub_category1: params[:sub_category1],
      sub_category2: params[:sub_category2],
      budget: params[:budget],
      budget_month_on_month: params[:budget_month_on_month],
      result_month_on_month: params[:result_month_on_month],
      budget_year_on_year: params[:budget_year_on_year],
      result_year_on_year: params[:result_year_on_year]
      )
    redirect_to action: :index and return
  end
  
  def budget_params
    params.require(:budget).permit(:user_id, :category, :sub_category1, :sub_category2, :budget, :budget_month_on_month, :result_month_on_month, :budget_year_on_year, :result_year_on_year)
  end
end
