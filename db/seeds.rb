require "csv"

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