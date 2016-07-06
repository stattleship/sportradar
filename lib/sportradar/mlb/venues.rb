module Sportradar
  module Mlb
    class Venues < Sportradar::ApiRequest
      def initialize
      end

      def path
        "league/venues.json"
      end
    end
  end
end
