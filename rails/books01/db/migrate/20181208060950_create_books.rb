class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :subtitle
      t.integer :year
      t.string :isbn

      t.timestamps
    end

    create_join_table :books, :authors, table_name: :publications do |t|
      t.index :book_id
      t.index :author_id
    end
  end
end
