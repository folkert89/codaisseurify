class CreateArtists < ActiveRecord::Migration[5.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :country_of_origin
      t.date :birth_date

      t.timestamps
    end
  end
end
