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
      self.all.find{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
      self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file_name)
      song_split = file_name.split("-")
      artist_name = song_split[0].strip
      song_name_and_format = song_split[1].strip
      song_name = song_name_and_format.chomp(song_name_and_format.match(/\.\w*\b/).to_s)

      song_from_file_name = self.new
      song_from_file_name.name = song_name
      song_from_file_name.artist_name = artist_name
      song_from_file_name
  end

  def self.create_from_filename(file_name)
      song_file_name = self.new_from_filename(file_name)
      song_file_name.save
      song_file_name
  end

  def self.destroy_all
      self.all.clear
  end

end
