class ActorFinder::Film
  attr_accessor :actor, :film_page, :name, :year

  @@all = {}

  def initialize(name, year, actor, film_page)
    self.name = name
    self.year = year
    self.actor = actor
    self.film_page = film_page
  end

  def self.all(actor:)
    @@all[actor.name] ||= ActorFinder::ImdbScraper.scrape_filmography(actor, actor.bio_page)
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
