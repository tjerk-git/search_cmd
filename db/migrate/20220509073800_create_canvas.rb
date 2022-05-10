class CreateCanvas < ActiveRecord::Migration[7.0]
  def change
    create_table :canvas do |t|
      t.string :name
      t.string :slug
      t.text :reason
      t.text :goals
      t.text :feedback
      t.text :inspiration
      t.text :practice
      t.text :consults
      t.text :foundation
      t.text :summary

      t.timestamps
    end
  end
end
