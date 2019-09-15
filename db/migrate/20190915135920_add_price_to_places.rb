class AddPriceToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_monetize :places, :price, currency: { present: false }
  end
end
