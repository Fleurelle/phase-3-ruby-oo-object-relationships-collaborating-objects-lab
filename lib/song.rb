require 'pry'
class Song
    attr_accessor :name, :artist

    @@all= []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
       @@all
    end

    def self.new_by_filename(name)       
        artist = name.split(" - ")[0]
        song = name.split(" - ")[1]
        newSong = self.new(song)
        newSong.artist_name = artist
        newSong
        # binding.pry
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
        # binding.pry
    end
end