 class Artist 
   extend Concerns::Findable
  
  attr_accessor :name, :songs, :genres 
  
  @@all = [] 
  
  def initialize(name)
    @name = name 
    save 
    @songs = [] 
  end 
  
  def save 
   @@all << self 
  end
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all 
    @@all.clear
  end 
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save 
    artist 
  end 
  
  def add_song(song)
      song.artist = self if song.artist == nil
      @songs << song if self.songs.include?(song) == false 
  end 
  
  def genres
    self.songs.collect {|s| s.genre}.uniq
  end 
end 