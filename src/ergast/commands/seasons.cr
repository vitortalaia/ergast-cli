module Ergast::Commands
  class Seasons < Admiral::Command
    define_help description: "Lists all the seasons of a series"
    define_flag series,
      description: "Defines the series (F1 or FE)",
      short: s,
      long: series,
      required: true

    def run
      seasons = Services::Seasons.new(flags.series.downcase).process

      puts Presenters::Seasons.new(seasons).to_table unless seasons.nil?
    end
  end
end
