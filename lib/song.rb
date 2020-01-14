class Song 
  extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre 
  
  @@all = [] 
  
  def initialize(name,artist=nil,genre=nil)
    @name = name 
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil 
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
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    self.genre.songs << self unless genre.songs.include?(self)
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
  
  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split("-")[1]
    song 
          #song.name = filename.split("-")[1]
          #song.artist = filename.split("-")[0]
          #song.genre = filename.split("-")[2]
  end 
  
  #def self.find_by_name(name)
   # self.all.detect {|song| song.name==name}
  #end 
  
  #def self.find_or_create_by_name(song)
   # find_by_name(song) || create(song)
  #end 
    
end 