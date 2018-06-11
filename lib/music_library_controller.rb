class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    musim = MusicImporter.new(@path)
  end
end
