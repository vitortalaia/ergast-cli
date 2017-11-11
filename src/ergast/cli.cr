require "admiral"

module Ergast
  class CLI < Admiral::Command
    define_version Ergast::VERSION
    define_help description: "A command line application to interact with Ergast Motorsport API"

    def run
      puts help
    end
  end
end
