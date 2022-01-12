class AddSlugAndLinksToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :teams_link, :string
    add_column :users, :dribble_link, :string
    add_column :users, :github_link, :string
    add_column :users, :slug, :string
  end
end
