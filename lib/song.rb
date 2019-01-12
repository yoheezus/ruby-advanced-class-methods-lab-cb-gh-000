class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
      song = self.new
      song.save
      song
  end

  def self.new_by_name(name)
      song_by_name = self.new
      song_by_name.name = name
      song_by_name
  end

  def self.create_by_name(name)
      song = new_by_name(name)
      song.save
      song
  end

  def self.find_by_name(name)
      self.class.all.find{ |song| song.name == name}
  end

end
