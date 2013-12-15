class Moment < ActiveRecord::Base

	validates :title, :image, :blog, :song, :presence => true

	belongs_to :user

	has_many :comments

	belongs_to :sound

 	mount_uploader :image, ImageUploader

 	before_save :fill_song_url


  def fill_song_url

    # title = URI::encode(self.title)
    # omdb_json = RestClient.get("http://www.omdbapi.com/?i=&t=#{title}")
    # omdb_movie = JSON.load(omdb_json)
    # self.poster = omdb_movie["Poster"]

    title = self.song
    client = Soundcloud.new(:client_id => '8e38e03320f1b0cdde7d69fe832142c9')
	tracks = client.get('/tracks', :q => title ,:limit => 1)
	
	if tracks.length != 0 

		self.song_url = tracks[0].uri

	end

  end

 

end
