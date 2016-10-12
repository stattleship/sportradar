module Sportradar
  module Nhl
    class Injuries < Sportradar::ApiRequest
      def initialize
      end

      def path
        "league/injuries.json"
      end
    end
  end
end
