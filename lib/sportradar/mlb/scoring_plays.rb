module Sportradar
  module Mlb
    class ScoringPlays
      def initialize(game_boxscore: {})
        @game_boxscore = game_boxscore
      end

      def game_id
        game_boxscore['id']
      end

      def away
        game_boxscore['away'] || {}
      end

      def away_team_id
        away['id']
      end

      def home
        game_boxscore['home'] || {}
      end

      def home_team_id
        home['id']
      end

      def away_events
        away['events'] || []
      end

      def home_events
        home['events'] || []
      end

      def events
        away_events + home_events
      end

      def away_team_plays
        away_events.map do |event|
          build_scoring_play(team_id: away_team_id,
                             event: event)
        end
      end

      def home_team_plays
        home_events.map do |event|
          build_scoring_play(team_id: home_team_id,
                             event: event)
        end
      end

      def all
        away_team_plays + home_team_plays
      end

      private

      attr_reader :game_boxscore

      def build_scoring_play(team_id:, event:)
        Sportradar::Mlb::Models::ScoringPlay.new(game_id: game_id,
                                                 team_id: team_id,
                                                 event: event)
      end
    end
  end
end
