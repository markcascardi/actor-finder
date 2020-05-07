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
    end
  end

  def self.scrape_filmography(actor, bio_page)
    actor_bio_page = "https://www.imdb.com#{bio_page}"
    doc = Nokogiri::HTML(open(actor_bio_page))
    film_elements = doc.css('.filmo-category-section')[0].css('.filmo-row')

    film_elements.map do |film|
      name = film.css('a').first.text
      year = film.css('.year_column').first.text.strip
      ActorFinder::Film.new(name, year, actor)
    end
  end
end
  # def self.scrape_film_location
  # end
  #



# 'https://movie-locations.com/movies/a/American-Hustle.php'
# https://www.imdb.com/name/nm0000136
