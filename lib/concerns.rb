module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect{|artist| artist.name == name}
    end

    def find_or_create_by_name(name)
      if song = self.find_by_name(name)
        song
      else
        song = self.create(name)
      end
      song
    end
  end
end
