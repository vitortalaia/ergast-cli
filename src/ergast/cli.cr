require "admiral"

require "./mappings/*"
require "./presenters/*"
require "./services/*"
require "./commands/*"

module Ergast
  class CLI < Admiral::Command
    define_version Ergast::VERSION
    define_help description: "A command line application to interact with Ergast Motorsport API"

    register_sub_command seasons, Commands::Seasons
    register_sub_command standings, Commands::Standings

    def run
      puts help
    end
  end
end
