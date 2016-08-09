module Sportradar
  module Nfl
    class LeagueHierarchy < Sportradar::Feeds::LeagueHierarchy
      def path
        "teams/hierarchy.json"
      end
    end
  end
end
