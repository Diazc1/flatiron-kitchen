class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :quantity,   default: 0


      t.timestamps null: false
    end
  end
end
