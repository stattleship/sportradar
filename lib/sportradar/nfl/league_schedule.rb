module Sportradar
  module Nfl
    class LeagueSchedule < Sportradar::Feeds::LeagueSchedule
      def path
        "#{year}/#{interval_type}/schedule.json"
      end
    end
  end
end
