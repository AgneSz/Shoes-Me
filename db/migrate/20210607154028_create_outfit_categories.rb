class CreateOutfitCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :outfit_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :outfit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
