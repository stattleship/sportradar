module Sportradar
  module Nba
    class LeagueSchedule < Sportradar::Feeds::LeagueSchedule
      def self.games(json:)
        [].tap do |games|
          (json['games'] || []).each do |game_json|
            games << game_json
          end
        end
      end
    end
  end
end

