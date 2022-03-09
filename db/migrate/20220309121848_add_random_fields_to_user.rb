class AddRandomFieldsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cats_or_dogs, :string, :default => ""
    add_column :users, :coffee_or_tea, :string, :default => ""
    add_column :users, :glasses, :string, :default => ""
    add_column :users, :music, :string, :default => ""
    add_column :users, :patat_or_friet, :string, :default => ""
    add_column :users, :height, :string, :default => ""
  end
end
