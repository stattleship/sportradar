module Sportradar
  module Nfl
    class Standings < Sportradar::Feeds::LeagueSchedule
      def path
        "teams/#{year}/#{interval_type}/standings.json"
      end
    end
  end
end
