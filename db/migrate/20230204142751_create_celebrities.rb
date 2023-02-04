class CreateCelebrities < ActiveRecord::Migration[7.0]
  def change
    create_table :celebrities do |t|
      t.string :name
      t.string :category
      t.integer :daily_rate
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
