module Sportradar
  module Mlb
    class TeamStatistics < Sportradar::Feeds::TeamStatistics
      def path
        "seasontd/#{year}/#{interval_type}/teams/#{team_id}/statistics.json"
      end
    end
  end
end
