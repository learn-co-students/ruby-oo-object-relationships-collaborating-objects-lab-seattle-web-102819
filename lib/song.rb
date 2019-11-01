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

    def self.new_by_filename(file_name)
        test = file_name.split(" - ")
        song_name = test[1]
        artist = test[0]
        new_song = self.new(song_name)
        new_song.artist_name= artist
        new_song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end

end
