module Sportradar
  module Mlb
    class LeagueHierarchy < Sportradar::ApiRequest
      def initialize
      end

      def path
        "league/hierarchy.json"
      end
    end
  end
end
