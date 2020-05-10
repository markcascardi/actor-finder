class ActorFinder::CLI
  def call
    puts "Welcome to Actor finder, where you can find an actor!"
    actor_menu
  end

  private

    def actor_menu
      display_loading_message
      ActorFinder::Actor.display_all
      puts "Select an actor by number for their movies. Type 'actors' to see actors:"

      loop do
        input = gets.chomp.downcase

        if input == "exit"
          break puts "Have a nice day!"
        elsif input == "actors"
          ActorFinder::Actor.display_all
        elsif input_valid?(input)
          break display_valid_film_list(input)
        else
          puts "Please enter a number between 1 and #{ActorFinder::Actor.count}, 'list', or 'exit'"
        end
      end
    end

    def movie_menu(actor: actor)
      display_loading_message(actor: actor)
      ActorFinder::Film.display_all(actor: actor)
      puts "Enter a number to rent or buy!! Enter 'actors' to see actors again:"

      loop do
        film_input = gets.chomp.downcase

        if film_input == "exit"
          break puts "Have a nice day!"
        elsif film_input == "actors"
          break actor_menu
        elsif film_input_valid?(film_input, actor)
          display_valid_film(film_input, actor)
        else
          puts "Invalid entry"
        end
      end
    end

    def display_valid_film(film_input, actor)
      film = actor.films[film_input.to_i - 1]
      display_loading_message(film: film)
      ActorFinder::ImdbScraper.scrape_film(film.film_page)
      insert_space
      puts "Select another movie or 'actors' to re-start your search"
    end

    def display_valid_film_list(input)
      actor = ActorFinder::Actor.all[input.to_i - 1]
      movie_menu(actor: actor)
    end

    def film_input_valid?(film_input, actor)
      0 < film_input.to_i && film_input.to_i <= actor.films.count
    end

    def input_valid?(input)
      0 < input.to_i && input.to_i <= ActorFinder::Actor.count
    end

    def display_loading_message(actor: nil, film: nil)
      loading_message = if actor
        "=============== Loading films for #{actor.name} ==============="
      elsif film
        "=============== Loading link for #{film.name} ==============="
      else
        "#{"=" * 25} Loading Actors #{"=" * 25}"
      end

      3.times { puts ("=" * loading_message.length).colorize(:light_green) }
      puts loading_message.colorize(:light_green)
      3.times { puts ("=" * loading_message.length).colorize(:light_green) }
    end

    def insert_space
      3.times { puts }
    end
end
