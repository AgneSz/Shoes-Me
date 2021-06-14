class AddUrlToShoes < ActiveRecord::Migration[6.0]
  def change
    add_column :shoes, :url, :string
  end
end
