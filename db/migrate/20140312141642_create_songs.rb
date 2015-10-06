class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :album_id
      t.integer :duration
      t.text :search_text
      t.references :user, index: true
      t.timestamps
    end
  end
end
