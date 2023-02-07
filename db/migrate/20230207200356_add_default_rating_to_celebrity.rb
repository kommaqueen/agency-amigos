class AddDefaultRatingToCelebrity < ActiveRecord::Migration[7.0]
  def change
    change_column :celebrities, :rating, :integer, :default => 0
  end
end
