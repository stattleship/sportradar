module Sportradar
  module Mlb
    class PlayerProfile < Sportradar::ApiRequest
      def initialize(player_id:)
        @player_id = player_id
      end

      def path
        "players/#{player_id}/profile.json"
      end

      private

      attr_reader :player_id
    end
  end
end
