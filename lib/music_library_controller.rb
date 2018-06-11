class MusicLibraryController
  attr_accessor :path

  def initialize(path)
    @path = path
    musim = MusicImporter.new(@path)
  end
end
