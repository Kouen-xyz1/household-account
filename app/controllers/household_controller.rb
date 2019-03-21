class HouseholdController < ApplicationController
  before_action :require_login
  def index
    @households = Household.where(user_id: current_user.id)
    categories = Category.all.select(:id, :name)
    @categories = Hash[categories.map{|category| [category.id, category.name]}]
    #@households = CategoriesMiddle.where(user_id: current_user.id)
    #categories_middles = CategoriesMiddle.all.select(:id, :name)
    #@categories_middles = Hash[categories_middles.map{|categories_middle| [categories_middle.id, categories_middle.name]}]


  end
  
  def new
  end
  
  def create
    Household.create(
      user_id: current_user.id,
      entry_date: params[:entry_date],
      category: params[:category],
      sub_category1: params[:sub_category1],
      sub_category2: params[:sub_category2],
      payment: params[:payment],
      result: params[:result],
      sum_credit: params[:sum_credit],
      check_out: params[:check_out],
      detail: params[:detail],
      analysis: params[:analysis],
      client: params[:client],
      content: params[:content]
      )
  redirect_to action: :index and return
  end
end