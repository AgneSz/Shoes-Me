class CreateShoeCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :shoe_categories do |t|
      t.references :shoe, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
