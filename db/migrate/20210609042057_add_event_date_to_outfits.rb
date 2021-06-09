class AddEventDateToOutfits < ActiveRecord::Migration[6.0]
  def change
    add_column :outfits, :event_date, :datetime
  end
end
