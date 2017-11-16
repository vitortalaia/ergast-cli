require "json"

module Ergast::Mappings
  class DriverStanding
    JSON.mapping(
      positionText: String,
      points: String,
      wins: String,
      driver: {
        key: "Driver",
        type: Mappings::Driver,
        nilable: false
      }
    )
  end
end
