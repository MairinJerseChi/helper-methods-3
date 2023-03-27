class AddImageUrlToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :image_url, :string
    add_column :movies, :string, :string
  end
end
