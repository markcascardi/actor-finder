class ActorFinder::Actor
  attr_accessor :bio_page, :name, :films

  def initialize(name, bio_page)
    self.name = name
    self.bio_page = bio_page
  end

  def self.all
    @@all ||= ActorFinder::ImdbScraper.scrape_actors
  end

  def films
    @films ||= ActorFinder::Film.all(actor: self)
  end

  def to_s
    name
  end

  def self.display_all
    all.each_with_index { |actor, i| puts "#{i + 1}. #{actor.name}"}
  end

  def self.count
    all.size
  end
end
