class AddImageUrlToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :image_url, :string
  end
end
