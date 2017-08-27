class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create

    # create a new instance of Song
    song = Song.new

    # save new instance of song to @@all
    song.save

    # return the new instance of song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    # note that although self.create returns song, we do not worry about this
    # the only thing that the method ultimately returns is "song" from the last
    # line
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    # note that the detect method returns the first for which the block is not
    # false. If none matches, returns nil.
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)

    #if song = self.find_by_name(name)
    #  song
    #else song = self.create_by_name(name)
    #  song
    #end
    # before you go for if/else control structure like this think about
    # whether a boolean statement would accomplish the same goal....

    # apparently, ruby returns the first true value here --> find_by_name
    self.find_by_name(name) || self.create_by_name(name)
  end

  # return all songs in ascending (a-z) alphabetical order
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    # parse input of form "Taylor Swift - Blank Space.mp3" into 2 item array
    artist_song_array = filename.split(/\s-\s|.mp3/)
    artist_name = artist_song_array[0]
    song_name = artist_song_array[1]

    # create instance of Song with song_name set
    song = self.create_by_name(song_name)

    # update your new instance with artist_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
