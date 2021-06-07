class CreateShoes < ActiveRecord::Migration[6.0]
  def change
    create_table :shoes do |t|
      t.string :brand
      t.string :generated_shoe
      t.references :outfit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
