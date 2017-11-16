require "json"

module Ergast::Mappings
  class Driver
    JSON.mapping(
      givenName: String,
      familyName: String,
    )
  end
end
