class AddConfirmToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :confirm, :integer
  end
end
