class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.text :search_text
      t.references :user, index: true
      t.timestamps
    end
  end
end
