class ActorFinder::Actor
  attr_accessor :bio_page, :name, :films

  # @@all = []

  def initialize(name, bio_page)
    self.name = name
    self.bio_page = bio_page
    # @@all << self
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

  # def self.actor_list
  #   # actor_1 = self.new
  #   # actor_1.name = "Harrison Ford"
  #   # actor_1.url = "https://www.imdb.com/name/nm0000148/"
  #   ActorFinder::ImdbScraper.scrape_actors
  # end

  # def actors
  #   @actors
  # end



# Actor - name, has many films, has many actors
