class ActorFinder::Film
  attr_accessor :actor, :name, :locations, :year

  def initialize(name, year, actor)
    self.name = name
    self.year = year
    self.actor = actor
  end

  def self.all(actor:)
    @@all ||= ActorFinder::ImdbScraper.scrape_filmography(actor, actor.bio_page)
  end

  def self.display_all(actor:)
    all(actor: actor).each_with_index do |film, index|
      display(film, index)
    end
  end

  def self.display(film, index)
    puts "#{index + 1}. #{film.name} - #{film.year}"
  end
end
  # def add_actor(actor)
  #   @actors << actor unless @actors.include?(actor)
  #   actor.film = self if actor.film.nil?
  # end

  # def self.all_by_actor(actor)
  #   all.select { |film| film.actor == actor }
  # end

  # def actor_film_list
  #   find_by_actor(actor)
  # end
