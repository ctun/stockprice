class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :symbol
      t.float :price

      t.timestamps null: false
    end
  end
end
