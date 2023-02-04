class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :celebrity, null: false, foreign_key: true
      t.date :starts_on
      t.date :ends_on

      t.timestamps
    end
  end
end
