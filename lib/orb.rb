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

    def summoner(value)
      if value.is_a? String
        return Summoner.new(Client.get('/v1.4/summoner/by-name/'+value+'?api_key='+api_key))
      else
        return Summoner.new(Client.get('/v1.4/summoner/'+vale.to_s+'?api_key='+api_key))
      end
    end


  end

end
