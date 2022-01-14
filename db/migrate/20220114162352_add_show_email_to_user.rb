class AddShowEmailToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :show_email, :integer
  end
end
