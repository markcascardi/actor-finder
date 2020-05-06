class ActorFinder::ImdbScraper

  def self.scrape_actors
    top_fifty_actors_url = "https://www.imdb.com/list/ls053501318/"
    doc = Nokogiri::HTML(open(top_fifty_actors_url))
    actor_elements = doc.css('div.lister-item-content')

    actor_elements.each_with_index do |actor, i|
      break if i == 4
      name = actor.css('h3 a').text.strip
      bio_page = actor.css('h3 a').first['href']
      ActorFinder::Actor.new(name, bio_page)
      binding.pry
    end
  end

  def self.scrape_filmography
    actor_bio_page = "https://www.imdb.com#{bio_page}"
    doc = Nokogiri::HTML(open(actor_bio_page))
  end
end

# https://www.imdb.com/name/nm0000136
