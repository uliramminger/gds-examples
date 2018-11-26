class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.integer :yearOfBirth
      t.belongs_to :country, index: true

      t.timestamps
    end
  end
end
