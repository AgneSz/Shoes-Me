class AddAttributesToOutfits < ActiveRecord::Migration[6.0]
  def change
    add_column :outfits, :event_type, :string
    add_column :outfits, :walking_time, :string
  end
end
