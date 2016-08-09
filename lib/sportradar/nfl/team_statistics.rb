module Sportradar
  module Nfl
    class TeamStatistics < Sportradar::Feeds::LeagueSchedule
      def initialize(year: nil, interval_type: nil, team_abbreviation:)
        super(year: year, interval_type: interval_type)
        @team_abbreviation = team_abbreviation
      end

      def path
        "teams/#{team_abbreviation}/#{year}/#{interval_type}/statistics.json"
      end

      private

      attr_reader :team_abbreviation
    end
  end
end
