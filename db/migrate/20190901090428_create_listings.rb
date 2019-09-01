class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :model
      t.integer :year
      t.string :color
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
