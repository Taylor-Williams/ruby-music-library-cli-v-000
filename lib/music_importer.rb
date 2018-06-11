require 'pry'
class MusicImporter
  attr_accessor :path, :files
  def initialize(path = "./db/mp3s")
    @path = path
  end

  def files
    @files = Dir.glob("#{path}/*")
    @files.map { |f| f.split("#{path}/")[1] }
  end

  def import
    self.files
    @files.each{|s| Song.create_from_filename(s)}
  end
end
