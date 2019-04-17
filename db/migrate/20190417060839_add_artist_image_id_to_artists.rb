class AddArtistImageIdToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :artist_image_id, :text
  end
end
