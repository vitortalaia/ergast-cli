require "json"

module Ergast::Mappings
  class Season
    JSON.mapping(
      season: String,
      url: String
    )
  end
end
