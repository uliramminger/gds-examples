class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.integer :population
      t.belongs_to :country, index: true

      t.timestamps
    end
  end
end
