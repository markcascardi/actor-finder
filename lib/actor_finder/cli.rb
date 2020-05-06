class ActorFinder::CLI

  def call
    puts "Welcome to Actor finder, where you can find an actor!"
    ActorFinder::ImdbScraper.scrape_actors
    ActorFinder::Actor.list_actors
    menu
  end

  def menu
    puts "Select a number for more info on an actor for more info. Type list to see main menu and exit to leave:"

    loop do
      input = gets.chomp.downcase

      if input == "exit"
        break
      elsif input == "list"
        ActorFinder::Actor.list_actors
      elsif 0 < input.to_i && input.to_i <= ActorFinder::Actor.count
        puts ActorFinder::Actor.all[input.to_i - 1]
      else
        puts "Please enter a number between 1 and #{ActorFinder::Actor.count}, 'list', or 'exit'"
      end
    end
  end
end

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
