class ActorFinder::CLI
  def call
    puts "Welcome to Actor finder, where you can find an actor!"
    ActorFinder::Actor.display_all
    main_menu
  end

  def main_menu
    puts "Select a number for more info on an actor for more info. Type list to see main menu and exit to leave:"

    loop do
      input = gets.chomp.downcase

      if input == "exit"
        break
      elsif input == "list"
        ActorFinder::Actor.display_all
        # ActorFinder::Actor.list_actors
      elsif 0 < input.to_i && input.to_i <= ActorFinder::Actor.count
        actor =  ActorFinder::Actor.all[input.to_i - 1]
        ActorFinder::Film.display_all(actor: actor)

        puts "Enter a number to purchase now! Enter 'list' to see actors again:"
        movie_input = gets.chomp.downcase

          if movie_input == "exit"
            break
          elsif movie_input == "list"
            ActorFinder::Actor.display_all
            main_menu
          elsif 0 < movie_input.to_i && movie_input.to_i <= actor.films.count
            puts "Great choice.! Ejoy your movie...and chill"
            break
          else
            puts "Please enter a number between 1 and #{actor.films.count}, 'list', or 'exit'"
          end
      else
        puts "Please enter a number between 1 and #{actor.films.count}, 'list', or 'exit'"
      end
    end
  end

  # def movie_menu
  #   puts "Enter a number to purchase now! Enter 'list' to see actors again:"
  #   movie_input = gets.chomp.downcase
  #
  #   loop do
  #     if movie_input == "exit"
  #       break
  #     elsif movie_input == "list"
  #       ActorFinder::Actor.display_list
  #       main_menu
  #     elsif 0 < movie_input.to_i && movie_input.to_i <= ActorFinder::Film.all.count
  #       puts "Great choice.! Ejoy your movie...and chill"
  #     end
  #   end
  # end
end
