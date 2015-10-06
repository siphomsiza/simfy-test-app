class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.date :release_date
      t.references :artist, index: true
      t.references :user, index: true
      t.text       :search_text
      t.timestamps
    end
  end
end
