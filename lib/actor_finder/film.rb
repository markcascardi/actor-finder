class ActorFinder::Film
  attr_accessor :actor, :name, :locations, :year

  @@all = []

  def initialize(name, year, actor)
    self.name = name
    self.year = year
    self.actor = actor
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_actor(actor)
    all.select { |film| film.actor == actor }
  end

  def actor_film_list
    find_by_actor(actor)
  end

  def self.list_films(actor)
    actor_films = ActorFinder::ImdbScraper.scrape_filmography(actor, actor.bio_page)

    actor_films.each_with_index do |film, i|
      puts "#{i + 1}. #{film.name} - #{film.year}"
    end
  end
end
  # def add_actor(actor)
  #   @actors << actor unless @actors.include?(actor)
  #   actor.film = self if actor.film.nil?
  # end
