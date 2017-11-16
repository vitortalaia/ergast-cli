require "terminal_table"

module Ergast::Presenters
  class Standings
    def initialize(@standings : Array(Mappings::DriverStanding))
    end

    def to_table
      table = TerminalTable.new
      table.headings = ["#", "Driver", "Points", "Wins"]
      table.separate_rows = true

      @standings.each do |standing|
        table << [
          "##{standing.positionText}",
          get_driver_name(standing.driver),
          standing.points,
          standing.wins
        ]
      end

      table.render
    end

    private def get_driver_name(driver)
      "#{driver.givenName} #{driver.familyName}"
    end
  end
end
