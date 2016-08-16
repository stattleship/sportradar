module Sportradar
  module Feeds
    class TeamStatistics < Sportradar::Feeds::LeagueSchedule
      def initialize(year: nil, interval_type: nil, team_id:)
        super(year: year, interval_type: interval_type)
        @team_id = team_id
      end

      def path
        "teams/#{team_id}/#{year}/#{interval_type}/statistics.json"
      end

      private

      attr_reader :team_id
    end
  end
end
