require 'pry'
class MP3Importer

    attr_accessor :path

    @@all = []
    def initialize(path)
        @path = path

        @@all << self
    end

    def files
        @files ||= Dir["#{@path}/*.mp3"]
        @files.map {|file| file.gsub("#{path}/", '')}
        
    end

    def import 
        self.files.each {|file| Song.new_by_filename(file)}
    end

    
end


