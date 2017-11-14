require "http/client"
require "json"

module Ergast::Services
  class Seasons

    def initialize(@series : String)
    end

    def process
      response = seasons_request
      parse_response(response)
    end

    private def seasons_request
      HTTP::Client.get "http://ergast.com/api/#{@series}/seasons.json?limit=100"
    end

    private def parse_response (response : HTTP::Client::Response)
      seasons = [] of Mappings::Season

      JSON.parse(response.body)["MRData"]["SeasonTable"]["Seasons"].each do |s|
        seasons << Mappings::Season.from_json(s.to_json)
      end

      seasons
    end
  end
end
