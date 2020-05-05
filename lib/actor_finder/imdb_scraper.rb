class ActorFinder::ImdbScraper

  def self.scrape_actors
    actors = []
    doc = Nokogiri::HTML(open("https://www.imdb.com/list/ls053501318/"))
    name = doc.search("h3.a").text
    actors << self
  end


end
