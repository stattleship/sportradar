module Sportradar
  module Nfl
    class Rankings < Sportradar::Feeds::LeagueSchedule
      def path
        "teams/#{year}/rankings.json"
      end
    end
  end
end
