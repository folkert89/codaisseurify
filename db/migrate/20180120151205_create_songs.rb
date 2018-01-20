class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :genre
      t.date :release_date

      t.timestamps
    end
  end
end
