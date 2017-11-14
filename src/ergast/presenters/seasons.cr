require "terminal_table"

module Ergast::Presenters
  class Seasons
    def initialize(@seasons : Array(Mappings::Season))
    end

    def to_table
      table = TerminalTable.new
      table.headings = ["Season", "Wikipedia entry"]
      table.separate_rows = true

      @seasons.each do |season|
        table << [season.season, season.url]
      end

      table.render
    end
  end
end
