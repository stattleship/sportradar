module Sportradar
  module Nfl
    class GameRequest < Sportradar::Nfl::WeeklySchedule
      def initialize(year: nil,
                     interval_type: nil,
                     week: 1,
                     away_team_abbreviation:,
                     home_team_abbreviation:)
        super(year: year, interval_type: interval_type, week: week)

        @away_team_abbreviation = away_team_abbreviation
        @home_team_abbreviation = home_team_abbreviation
      end

      def game_path
        "#{year}/#{interval_type}/#{week}/#{away_team_abbreviation}/#{home_team_abbreviation}"
      end

      private

      attr_reader :away_team_abbreviation, :home_team_abbreviation
    end
  end
end
