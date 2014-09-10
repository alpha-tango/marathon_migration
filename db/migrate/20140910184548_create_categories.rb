class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category, null: false, unique: true
    end
  end
end
