require 'pry'
class Artist
    attr_accessor :name
    

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_by_name(name)
        self.all.find {|artist| artist.name == name}
    end

    def self.create_by_name(name)
        artist = self.new(name)
    end
    
    def self.find_or_create_by_name(name)
        self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
    end

    def print_songs
        puts songs.collect {|song| song.name}
    end
end