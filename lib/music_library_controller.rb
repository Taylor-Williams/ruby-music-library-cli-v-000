class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    musim = MusicImporter.new(@path)
    musim.import
  end

  def call
    puts "Welcome to your music library!"
  end
end
