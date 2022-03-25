class AddShapeToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :shape, :string, :default => ""
  end
end
