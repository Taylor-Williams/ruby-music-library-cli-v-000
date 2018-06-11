module Concerns
  module Findable
    def find_by_name(name)
      self.all.detect{|artist| artist.name == name}
    end

    def find_or_create_by_name(name)
      self.create(name) if !self.find_by_name(name)
      end
      song
    end
  end
end
