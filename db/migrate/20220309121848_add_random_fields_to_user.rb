class AddRandomFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cats_or_dogs, :string
    add_column :users, :coffee_or_tea, :string
    add_column :users, :glasses, :string
    add_column :users, :music, :string
    add_column :users, :patat_or_friet, :string
    add_column :users, :height, :string
  end
end
