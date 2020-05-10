class ActorFinder::ImdbScraper
  def self.scrape_actors
    top_fifty_actors_url = "https://www.imdb.com/list/ls053501318/"
    doc = Nokogiri::HTML(open(top_fifty_actors_url))
    actor_elements = doc.css("div.lister-item-content")

    actor_elements.map do |actor|
      name = actor.css("h3 a").text.strip
      bio_page = actor.css("h3 a")[0]["href"]
      ActorFinder::Actor.new(name, bio_page)
    end
  end

  def self.scrape_filmography(actor, bio_page)
    actor_bio_url = "https://www.imdb.com#{bio_page}"
    doc = Nokogiri::HTML(open(actor_bio_url))
    film_elements = doc.css(".filmo-category-section")[0].css(".filmo-row")

    film_elements.map do |film|
      name = film.css("a").first.text
      year = film.css(".year_column").first.text.gsub(/\W/, "")
      film_page = film.css("a")[0]["href"]
      ActorFinder::Film.new(name, year, actor, film_page)
    end
  end

  def self.scrape_film(film_page)
    film_info_url = "https://www.imdb.com#{film_page}"
    doc = Nokogiri::HTML(open(film_info_url))
    view_film_page = doc.css(".buybox.buybox--default.buybox--desktop").css("a")[0]["href"]
    view_film_url = "https://www.imdb.com#{view_film_page}"

    if view_film_page.nil?
      puts "So sorry - this film is not available at this time"
    else
      puts "Click here to view:".colorize(:light_white)
      puts "#{view_film_url}".colorize(:light_blue)
    end
  end
end
