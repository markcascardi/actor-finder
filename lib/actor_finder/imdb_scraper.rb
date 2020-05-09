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
      # `open #{godfather}`
      # puts "Click here to view: #{view_film_url}".colorize(:light_blue)
      `printf '\e]8;;%{view_film_url}\e\\This is a link\e]8;;\e\\\n'`
      # `printf '\e]8;;%{view_film_url}\e\\This is a link\e]8;;\e\\\n' % {view_film_url: view_film_url}`
      # printf '\e]8;;http://example.com\e\\This is a link\e]8;;\e\\\n'
    end
  end

  # def self.scrape_amazon(name)
  #   name = name.downcase.split(" ").join("+")
  #   film_info_url = "https://www.amazon.com/s?k=#{name}&i=movies-tv"
  #
  #   user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_0) AppleWebKit/535.2 (KHTML, like Gecko) Chrome/15.0.854.0 Safari/535.2"
  #   doc = Nokogiri::HTML(open(film_info_url, 'User-Agent' => user_agent), nil, "UTF-8")
  #   binding.pry # doc = Nokogiri::HTML(open(film_info_url))
  #   view_film_url = doc.css("div.a-section.a-spacing-medium a")["href"]
  #
  #   `open https://www.amazon.com/Godfather-Marlon-Brando/dp/B005DNPFUE/ref=sr_1_1?dchild=1&keywords=the+godfather&qid=1588997645&s=instant-video&sr=1-1`
  # end
end

# https://www.amazon.com/s?k=the+godfather&i=movies-tv
# # https://www.imdb.com/offsite/?page-action=offsite-amazon&token=BCYo4jyMUrfU-QtTzEsk3dvQfTXCxfcuAjG1nvm11-Yypik0FPLA2ithFu9_PC3osYMDtkOIO3Gx%0D%0ANIcU7UGmreW5WyriVfRo0QJQ3bWoR43RYSfSxs8twSuKpgi-EhV46zyxH9CXZUozE5VwnzCLIInX%0D%0A819AziNcGUTClXRKZsB97ERPCSSeCAMF_HZYDQ1nLy0WpU0GqdZDtAwtEZiwB7JQAJw5we6EheX8%0D%0AF3OxNZUJ69mO368NbcIpZPdtF3jMkltob6uRk4Gcx0Z9rKEIhfE__g%0D%0A
# https://www.amazon.com/gp/video/detail/amzn1.dv.gti.64a9f786-efb1-28d3-bf27-6038d12cc53a?tag=imdbtag_tt_wbr_pvc_cbsaacf-20


# https://www.imdb.com/name/nm0000136
# https://www.imdb.com/title/tt3402236/
