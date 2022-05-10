class AddToCanvasmore < ActiveRecord::Migration[7.0]
  def change
    add_column :canvas, :comp, :string, :default => ""
    add_column :canvas, :lvl, :string, :default => ""
  end
end
