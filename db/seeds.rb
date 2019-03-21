require "csv"

CSV.foreach('db/initial_household.csv') do |row|
  Household.create(
    :user_id => row[0], 
    :entry_date => row[1], 
    :category => row[2],
    :sub_category1 => row[3],
    :sub_category2 => row[4],
    :payment => row[5], 
    :result => row[6], 
    :sum_credit => row[7], 
    :check_out => row[8], 
    :detail => row[9], 
    :analysis => row[10], 
    :client => row[11], 
    :content => row[12])
end

CSV.foreach('db/initial_budget.csv') do |row|
  Budget.create(
    :user_id => row[0], 
    :category => row[1],
    :sub_category1 => row[2],
    :sub_category2 => row[3],
    :budget => row[4], 
    :budget_month_on_month => row[5], 
    :result_month_on_month => row[6], 
    :budget_year_on_year => row[7], 
    :result_year_on_year => row[8])
end

CSV.foreach('db/initial_profit.csv') do |row|
  Profit.create(
    :user_id => row[0], 
    :category => row[1],
    :sub_category1 => row[2],
    :sub_category2 => row[3],
    :year_2019_01 => row[4], 
    :year_2019_02 => row[5], 
    :year_2019_03 => row[6])
end

CSV.foreach('db/initial_asset.csv') do |row|
  Asset.create(
    :user_id => row[0], 
    :asset_type => row[1],
    :name => row[2])
end

CSV.foreach('db/initial_category.csv') do |row|
  unless Category.find_by(id: row[0])
    Category.create(
      id: row[0],
      name: row[1]
      )
  end
end

CSV.foreach('db/initial_category_middle.csv') do |row|
  unless CategoriesMiddle.find_by(id: row[0])
    CategoriesMiddle.create(
      id: row[0],
      name: row[1]
      )
  end
end

CSV.foreach('db/initial_category_low.csv') do |row|
  unless CategoriesLow.find_by(id: row[0])
    CategoriesLow.create(
      id: row[0],
      name: row[1]
      )
  end
end