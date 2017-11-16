require "http/client"
require "json"

module Ergast::Services
  class Standings

    def initialize(@series : String, @season : Int32)
    end

    def process
      response = standings_request
      parse_response(response)
    end

    private def standings_request
      HTTP::Client.get "http://ergast.com/api/#{@series}/#{@season}/driverStandings.json?limit=100"
    end

    private def parse_response (response : HTTP::Client::Response)
      standings = [] of Mappings::DriverStanding

      JSON.parse(response.body)["MRData"]["StandingsTable"]["StandingsLists"][0]["DriverStandings"].each do |d|
        standings << Mappings::DriverStanding.from_json(d.to_json)
      end

      standings
    end
  end
end
