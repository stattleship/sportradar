module Sportradar
  module Nfl
    class PlaySummary < Sportradar::Nfl::PlayByPlay
      def initialize(year: nil,
                     interval_type: nil,
                     week: 1,
                     away_team_abbreviation:,
                     home_team_abbreviation:,
                     play_id:)
        super(year: year,
              interval_type: interval_type,
              week: week,
              away_team_abbreviation: away_team_abbreviation,
              home_team_abbreviation: home_team_abbreviation)
        @play_id = play_id
      end

      def path
        "#{game_path}/plays/#{play_id}.json"
      end

      private

      attr_reader :play_id
    end
  end
end
