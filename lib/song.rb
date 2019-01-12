class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name, artist_name)
      song = self.new
      song.name = name
      song.artist_name = artist_name
      song.save
      song
  end

end
