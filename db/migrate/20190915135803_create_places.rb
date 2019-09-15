class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :location
      t.string :name
      t.references :category, foreign_key: true
      t.string :description
      t.string :photo
      t.date :event_time

      t.timestamps
    end
  end
end
