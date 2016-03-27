require "orb/version"
require 'uri/common'

class Orb
  class << self

    def configure(api_key, region = "lan")
      region.downcase!
      raise Orb::Error::InvalidRegion "Invalid region" unless ['br','eune','euw','lan','las','oce','kr','tr','ru','na'].include?(region)
      Client.default_params :api_key => api_key
      Client.base_uri "https://lan.api.pvp.net/api/lol/#{region}"
      self
    end
    #Methods used for summoner data
    def summoner(value)
      if value.is_a? String
        return Summoner.new(Client.get('/v1.4/summoner/by-name/'+value))
      else
        return Summoner.new(Client.get('/v1.4/summoner/'+vale.to_s))
      end
    end

    def masteries(id)
      Client.get("/v1.4/summoner/#{id.to_s}/masteries")["pages"].map {|page| MasteryPage.new(page)}
    end

    def runes(id)
      Client.get("/v1.4/summoner/#{id.to_s}/runes")["pages"].map {|page| RunePage.new(page)}
    end

    def recent_games(id)
      games = Client.get("/v1.3/game/by-summoner/#{id.to_s}/recent")["games"].map {|game| Game.new(game)}
      games.sort { |x, y| y.created_at <=> x.created_at }
    end

    def teams(id)
      Client.get("/v2.4/team/by-summoner/#{id.to_s}").map {|team| Team.new(team)}
    end

    def game_stats(id, season = nil)
      Stats.new(Client.get("/v1.3/stats/by-summoner/#{id}/summary", query: {"season" => season.to_s}))
    end

    def ranked_stats(id, season = nil)
      ChampionStats.new(Client.get("/v1.3/stats/by-summoner/#{id}/ranked", query: {"season" => season.to_s}))
    end

    def leagues(id)
      Client.get("/v2.5/league/by-summoner/#{id}").map { |id, league| League.new(league, id) }
    end

    # General Methods
    def all_champions
        @@champions = Client.get("/v1.2/champion")["champions"].map {|champ| Champion.new(champ)}
    end

    def champion(value)
      if value.is_a? String
        self.all_champions.find {|champ| champ.name == value}
      else
        self.all_champions.find {|champ| champ.id == value}
      end
    end

    def free_to_play_champs
      @@freeChamps = Client.get("/v1.2/champion/", query: {"freeToPlay" => true})["champions"].map {|champ| Champion.new(champ)}
    end


  end

end
