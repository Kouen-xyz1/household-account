class CreateCategoriesMiddles < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_middles do |t|
      t.string :name

      t.timestamps
    end
  end
end
