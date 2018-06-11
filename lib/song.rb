require 'pry'
class Song
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods
  attr_accessor :name, :songs, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
  end

  def artist=(artist)
    puts artist.class.name
    if artist.class.name != "Artist"
      artist = Artist.find_or_create_by_name(artist)
      puts artist
    end
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.new_from_filename(file)
    parsed = file.split(" - ")
    song = self.new(parsed[1], parsed[0], parsed[2].split(".mp3")[0])
  end

end
