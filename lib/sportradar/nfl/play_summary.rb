module Sportradar
  module Nfl
    class PlaySummary < Sportradar::Nfl::PlayByPlay
      def initialize(year: nil,
                     interval_type: nil,
                     week: 1,
                     away_team_abbreviation: nil,
                     home_team_abbreviation: nil,
                     play_id: nil,
                     details: nil)
        super(year: year,
              interval_type: interval_type,
              week: week,
              away_team_abbreviation: away_team_abbreviation,
              home_team_abbreviation: home_team_abbreviation)
        @play_id = play_id
        @details = details

        raise ArgumentError.new('A play_id or details path is required.') unless play_id || details
      end

      def path
        if details
          details
        else
          "#{game_path}/plays/#{play_id}.json"
        end
      end

      private

      attr_reader :play_id, :details
    end
  end
end
