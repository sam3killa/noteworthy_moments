class AddSongUrlToMoments < ActiveRecord::Migration
  def change
    add_column :moments, :song_url, :string
  end
end
