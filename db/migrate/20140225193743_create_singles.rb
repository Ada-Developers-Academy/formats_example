class CreateSingles < ActiveRecord::Migration
  def change
    create_table :singles do |t|
      t.string :title
      t.string :artist
      t.integer :length
      t.datetime :release_date
      t.text :lyrics

      t.timestamps
    end
  end
end
