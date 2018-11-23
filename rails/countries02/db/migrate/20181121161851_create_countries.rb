class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :capital
      t.integer :area
      t.bigint :population
      t.string :vehicleRegistrationCode
      t.string :iso3166code
      t.integer :callingCode

      t.timestamps
    end
  end
end
