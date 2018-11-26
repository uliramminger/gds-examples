class CreateMuseums < ActiveRecord::Migration[5.2]
  def change
    create_table :museums do |t|
      t.string :name
      t.integer :established
      t.belongs_to :city, index: true

      t.timestamps
    end
  end
end
