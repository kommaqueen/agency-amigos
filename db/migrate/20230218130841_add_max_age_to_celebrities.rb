class AddMaxAgeToCelebrities < ActiveRecord::Migration[7.0]
  def change
    add_column :celebrities, :max_age, :integer
  end
end
