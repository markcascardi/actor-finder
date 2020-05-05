class ActorFinder::CLI

  def call
    puts "Welcome to Actor finder, where you can find an actor!"
    list_actors
    menu
  end

  def list_actors
    @actors = ActorFinder::Actor.actor_list
    @actors.each_with_index { |actor, i| puts "#{i + 1}. #{actor.name}"}
  end

  def menu
    puts "Select a number for more info on an actor for more info. Type list to see main menu and exit to leave:"
    input = nil
    while input != "exit"
      input = gets.chomp.downcase
      if input.to_i > 0
        puts @actors[input.to_i - 1]
      elsif input == "list"
        list_actors
      else
        "Please enter a number between 1 and 50, 'list' or exit"
      end
    end
  end
end

# Select an actor from Star Wars to see filmography
# 1. Carrie Fisher
# 2. Harrison Ford
# 3. Mark Hamill  nm0000434
# 4. Ewan McGregor
# 5. Samuel L Jackson
# 6. Natalie Portman
# 7. Liam Neeson
# 8. James Earl Jones
# 9. Laura Dern
# 10. Adam Driver
#
# Url to scrape: https://www.imdb.com/name/<actor id here>
# 	scraping for filmography for film titles
# 	- display numbered list of locations
# 	select a movie to see film locations
# 	OR
# 	see all filming locations
#
# Url to scrape 	https://www.imdb.com/title/<film id here/locations
# 	if they select number
# 	- display list of locations that are unique and have at least 3 elements (city, state, country)
# 	if they select all
# 	- display location of every movie and the movie along with it
# 	Want to narrow your search?
# 	Select a state
# 	- display numbered list of state abbreviations that are included in Actors collection of states
# 	get choice
# 	- display list of locations with movie by selected state abbreviation
#
# Do I scrape and store data then run code from stored data?
#
# Actor - name, has many films, has many actors
#
# Film - name, has many films, has many actors
#
# Location - name, has many films, has many actors
#
# Role
