class Song 
  
  attr_accessor :name, :artist 
  
  @@all = [] 
  
  def initialize(name,artist=nil)
    @name = name 
    @artist = artist  
  end 
  
  def self.all 
    @@all 
  end 
  
  def save 
    @@all << self
  end 
  
  def self.create(song)
    song = Song.new(song)
    song.save 
    song 
  end 
  
  def self.artist=(artist)
    Song.artist = Artist 
    song = Artist.add_song(song)
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
end 