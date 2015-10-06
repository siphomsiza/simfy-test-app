json.array!(@albums) do |album|
  json.extract! album, :id, :name, :release_date, :artist_id, :cover
  json.url album_url(album, format: :json)
end
