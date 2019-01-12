class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist_name)
      @name = name
      @artist_name = artist_name
  end

  def save
    self.class.all << self
  end

  def self.create
      self.all << self
  end

end
