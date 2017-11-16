module Ergast::Commands
  class Standings < Admiral::Command
    define_help description: "Lists the driver standings for a specific series in a season"
    define_flag series,
      description: "Defines the series (F1 or FE)",
      short: s,
      long: series,
      required: true

    define_flag season : Int32,
      description: "Defines the season (run seasons subcommand to know the options)",
      long: season,
      required: true

    def run
      standings = Services::Standings.new(flags.series.downcase, flags.season).process

      puts Presenters::Standings.new(standings).to_table unless standings.nil?
    end
  end
end
