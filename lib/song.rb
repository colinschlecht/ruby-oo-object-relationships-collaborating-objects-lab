class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song = Song.new(filename.split(" - ")[1])
        song.name = filename.split(" - ")[1]
        song.artist = filename.split(" - ")[0]
        Artist.find_or_create_by_name(song.artist).add_song(song)
        song
    end

    def artist_name=(name)
        Artist.find_or_create_by_name(name).add_song(self)
    end
      
end