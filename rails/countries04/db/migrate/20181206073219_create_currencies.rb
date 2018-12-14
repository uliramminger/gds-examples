class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :symbol
      t.string :iso4217code
      t.integer :iso4217number
      t.string :subunit

      t.timestamps
    end
  end
end
