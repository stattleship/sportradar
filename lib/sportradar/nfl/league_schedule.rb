module Sportradar
  module Nfl
    class LeagueSchedule < Sportradar::Feeds::LeagueSchedule
      def fetch
        super.tap do |json|
          season = json['season']
          interval_type =  json['type']
          (json['weeks'] || []).each do |week_json|
            (week_json['games'] || []).each do |game_json|
              game_json['season'] = season
              game_json['interval_type'] = interval_type
              game_json['week'] = week_json['number']
            end
          end
        end
      end

      def self.games(json:)
        [].tap do |games|
          (json['weeks'] || []).each do |week_json|
            (week_json['games'] || []).each do |game_json|
              games << game_json
            end
          end
        end
      end

      def path
        "#{year}/#{interval_type}/schedule.json"
      end
    end
  end
end
