------LEVEL 1------

1.
games = ["Super Mario Bros.", "Contra", "Metroid", "Mega Man 2"]
unless games.empty?
  puts "Games in your vast collection: #{games.count}"
end

2.
games = ["Super Mario Bros.", "Contra", "Metroid", "Mega Man 2"]

puts "Games in your vast collection: #{games.count}" unless games.empty?

3.
search |= "Contra"
games = ["Super Mario Bros.", "Contra", "Metroid", "Mega Man 2"]
search_index = games.find_index(search)
if search_index
  puts "Game #{search} Found: #{games[search_index]} at index #{search_index}."
else
  puts "Game #{search} not found."
end

4.
search = "Super Mario Bros."
games = ["Super Mario Bros.", "Contra", "Metroid", "Mega Man 2"]
matched_games = games.grep(Regexp.new(search))

# Found an exact match
if matched_games.length > 0
 matched_games.include?(search)
    puts "Game #{search} found."
end

5.
search ||= "" 
games = ["Super Mario Bros.", "Contra", "Metroid", "Mega Man 2"]
matched_games = games.grep(Regexp.new(search))
puts "Found the following games..."
matched_games.each do |game|
  puts "- #{game}"
end  

6.
search = "Contra"
games = ["Super Mario Bros.", "Contra", "Metroid", "Mega Man 2"]
search_index = games.find_index(search)
search_result = if search_index
  "Game #{search} found: #{games[search_index]} at index #{search_index}."
else
  "Game #{search} not found."
end
puts search_result

7.
def search(games, search_term)
  search_index = games.find_index(search_term)
 if search_index
    "Game #{search_term} found: #{games[search_index]} at index #{search_index}."
  else
    "Game #{search_term} not found."
  end

end

games = ["Super Mario Bros.", "Contra", "Metroid", "Mega Man 2"]
puts search(games, "Contra")

8.
def search_index(games, search_term)
  search_index = games.find_index(search_term) or "Not Found"
end


------LEVEL 2------

1.
def new_game(name, year=nil, system=nil )
  {
    name: name,
    year: year,
    system: system
  }
end
game = new_game("Street Figher II")

2.
def new_game(name, options ={})
  {
    name: name,
    year: options[:year],
    system: options[:system]
  }
end
game = new_game("Street Figher II", 
                :year=>"SNES", 
                :system=>1992
  )
  
3.
class InvalidGameError < StandardError; end
def new_game(name, options={})
  raise InvalidGameError, "You must provide a name for this game." unless name
  {
    name: name,
    year: options[:year],
    system: options[:system]
  }
end
begin
  game = new_game(nil)
rescue InvalidGameError => e
  puts "There was a problem creating your new game: #{e.message}"
end

4.
def describe_favorites(*games)
  for game in games
    puts "Favorite Game: #{game}"
  end
end
describe_favorites('Mario', 'Contra', 'Metroid')

5.
class Game
  def initialize(name, options={})
    @name = name
    @year = options[:year]
    @system = options[:system]
  end
end

6.
class Game
  attr_accessor :name, :year, :system

  def initialize(name, options={})
    @name = name
    @year = options[:year]
    @system = options[:system]
  end
end

7.
class Game
  attr_accessor :name, :year, :system
  attr_reader :created_at

def initialize(name, options={})
    @name = name
    @year = options[:year]
    @system = options[:system]
    @created_at =Time.now
  end
end

------LEVEL 3------

1.
class Library
  attr_accessor :games
  def initialize(games)
    @games = games
  end
end

2.
class Library
  attr_accessor :games

  def initialize(games)
    self.games = games
  end

  def has_game?(search_name)
    for game in games
      return true if game == search_name
    end
    false
  end
end

3.
class Library
  attr_accessor :games

  def initialize(games)
    self.games = games
  end 
 
  def has_game?(search_game)
    for game in games
      return true if game == search_game
    end
    false
  end
   def add_game (game)
    @games << game
  end
end

4.
class Library
  attr_accessor :games

  def initialize(games)
    self.games = games
  end

  def has_game?(search_game)
    for game in games
      return true if game == search_game
    end
    false
  end

  def add_game(game)
    games << game
     log("Added the game #{game}")
    
  end
  private
  def log (massege)
    puts massege
  end
end

5.

class ArcadeGame < Game
end
 class ConsoleGame < Game
end

6.
class ArcadeGame < Game
  attr_accessor :weight
  def initialize (name, options={})
    super
    self.weight = options[:weight]
    
  end
end
class ConsoleGame < Game
end

7.
class ConsoleGame < Game
  def to_s 
    "#{self.name} - #{self.system}"    
  end

end

8.
class Game
  attr_accessor :name, :year, :system
  attr_reader :created_at
  def initialize(name, options={})
    self.name = name
    self.year = options[:year]
    self.system = options[:system]
    @created_at = Time.now
  end

  def to_s
    self.name
  end

  def description
    "#{self} was released in #{self.year}."
  end
end

class ConsoleGame < Game
  def to_s
    "#{self.name} - #{self.system}"
  end

end

------LEVEL 4------

1.
def last_games(games, index)
  games.from(index)
end
games = ["Super Mario Bros.", "Contra", "Metroid", "Mega Man 2"]
puts last_games(games, 1)

2.
def first_games(games, index)
  games.to(index)
end
games = ["Super Mario Bros.", "Contra", "Metroid", "Mega Man 2"]
puts first_games(games,2)

3.
def anniversary(game, years)
  game[:release].advance(years: years)
end

game = {
  name: 'Contra',
  release: DateTime.new(1987, 2, 20, 0, 0, 0)
}
puts anniversary(game,20 )

4.
def difference_between(player1, player2)
  player1.diff(player2)
end

mario_favorite = {
  sports: "Mario Sports Mix",
  action: "Super Mario World"
}

luigi_favorite = {
  sports: "Golf",
  action: "Super Mario World"
}

puts difference_between(mario_favorite, luigi_favorite)

5.
def exclude_character(games, character)
  games.except(character)
end

games = {
  mario: ["Super Mario World", "Super Smash Bros. Melee"],
  luigi: ["Luigi's Mansion"],
  yoshi: ["Yoshi's Island", "Yoshi's Story"]
}
puts exclude_character(games, :yoshi)

6.
def describe_count(games)
  if games.empty?
    "You have no games"
  elsif games.length.even?
    "You have an even number of games"
  elsif games.length.odd?
    "You have an odd number of games"
  end
end

games = ["Super Mario Bros.", "Contra", "Metroid", "Mega Man 2"]
puts describe_count(games)

7.
def convert_title(title)
  title.titleize
end

puts convert_title("super mario bros.")


------LEVEL 5------

1.
module GameUtils
def 
  self.lend_to_friend(game, friend_email)
end
end
game = Game.new("Contra")
GameUtils.lend_to_friend(game, "gregg@codeschool.com")

2.
class Game
  include GameUtils
end


game = Game.new("contra")
game.lend_to_friend("Gregg")

3.
class Game
  extend GameUtils
end

Game.find_all_from_user("Gregg")

4.
game = Game.new("Contra")
game.extend(Playable) 
game.play

5.
module LibraryUtils
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  def add_game(game)
  end

  def remove_game(game)
  end

  module ClassMethods
    def search_by_game_name(name)
    end
  end
end

class AtariLibrary
  include LibraryUtils
end

6.
module LibraryUtils
  extend ActiveSupport::Concern
  def add_game(game)
  end

  def remove_game(game)
  end

  module ClassMethods
    def search_by_game_name(name)
    end
  end
end

7.
module LibraryUtils

  extend ActiveSupport::Concern
  included do 
    load_game_list  
  end
 
  def add_game(game)
  end

  def remove_game(game)
  end

  module ClassMethods
    def search_by_game_name(name)
    end

    def load_game_list
    end
  end
end

8.
module LibraryLoader
  extend ActiveSupport::Concern

  module ClassMethods
    def load_game_list
    end
  end
end

module LibraryUtils
  extend ActiveSupport::Concern
  include LibraryLoader

  included do
    load_game_list
  end
end

class AtariLibrary
  include LibraryUtils
end

------LEVEL 6------

1.
class Library
  attr_accessor :games

  def initialize(games = [])
    self.games = games
  end

  def list
    games.each do |game|
      puts game.name
    end
  end
end

2.
class Library
  attr_accessor :games

  def initialize(games = [])
    self.games = games
  end

  def each_on_system(system)
    games.each do |game|
      yield if game.system == system
    end
  end
end

3.
class Library
  attr_accessor :games

  def initialize(games = [])
    self.games = games
  end

  def each_on_system(system)
    games.each do |game|
      yield game if game.system == system
    end
  end
end

4.
class Library
  attr_accessor :games

  def initialize(games = [])
    self.games = games
  end

  def list
    games.each do |game|
    puts  yield game
    end
  end
end

5.
class Library
  include Enumerable

  attr_accessor :games

  def initialize(games = [])
    self.games = games
  end

  def each
    games.each do |game|
      yield game
    end
  end
end

6.
class Game
  attr_accessor :name, :year, :system
  attr_reader :created_at

  def initialize(name, options={})
    self.name = name
    self.year = options[:year]
    self.system = options[:system]
    @created_at = Time.now
  end

  def play
    emulate do |emulator|
      emulator.play(self)
    end
  end

  def screenshot
    emulate do |emulator|
      emulator.start(self)
      emulator.screenshot
    end
  end

  private

  def emulate
    begin
      emulator = Emulator.new(system)
      yield emulator
    rescue Exception => e
      puts "Emulator failed: #{e}"
    end
  end
end 
