class AddToCanva < ActiveRecord::Migration[7.0]
  def change
    add_column :canvas, :ec, :string, :default => ""
    add_column :canvas, :uuid, :string, :default => ""
  end
end
