require 'pry'
class MP3Importer
    attr_accessor :path, :file

    def initialize(path)
        @path = path
    end

    def files
        @file = Dir.glob('*', base: @path)
    end

    def import
        files.each {|filename| Song.new_by_filename(filename)}
    end



end