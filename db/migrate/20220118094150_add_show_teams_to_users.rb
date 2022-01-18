class AddShowTeamsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :show_teams, :integer
  end
end
