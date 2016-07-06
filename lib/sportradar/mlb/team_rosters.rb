module Sportradar
  module Mlb
    class TeamRosters < Sportradar::ApiRequest
      def initialize
      end

      def path
        "league/full_rosters.json"
      end
    end
  end
end
