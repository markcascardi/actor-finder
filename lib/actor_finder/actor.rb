class ActorFinder::Actor
  attr_accessor :id, :movies, :name, :roles


    def self.actor_list
      actor_1 = self.new
      actor_1.name = "Harrison Ford"
      actor_1.url = "https://www.imdb.com/name/nm0000148/"
      ActorFinder::ImdbScraper.new("https://www.imdb.com/list/ls053501318/")
    end


end

# Actor - name, has many films, has many actors
