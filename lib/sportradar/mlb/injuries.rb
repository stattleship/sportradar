module Sportradar
  module Mlb
    class Injuries < Sportradar::ApiRequest
      def initialize
      end

      def path
        "league/injuries.json"
      end
    end
  end
end
