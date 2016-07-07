module Sportradar
  module Mlb
    class TeamActiveRosters < Sportradar::ApiRequest
      def initialize
      end

      def path
        "league/active_rosters.json"
      end
    end
  end
end
