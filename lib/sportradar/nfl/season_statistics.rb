module Sportradar
  module Nfl
    class SeasonStatistics < Sportradar::Nfl::TeamsRequest
      def initialize(year:, interval_type:)
        @year = year || Date.today.strftime('%Y')
        @interval_type = interval_type || 'reg'
      end

      def self.perform(year:, interval_type:)
        new(year: year, interval_type: interval_type).perform
      end

      def perform
        team_abbreviations.each do |team_abbreviation|
          TeamStatistics.new(year: year,
                             interval_type: interval_type,
                             team_abbreviation: team_abbreviation).save
        end

        nil
      end

      private

      attr_reader :interval_type, :year
    end
  end
end
