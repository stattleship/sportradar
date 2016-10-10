module Sportradar
  module Nhl
    module Parsers
      class PlayByPlayParser
        def initialize(game_play_by_play: {})
          @game_play_by_play = game_play_by_play['game'] || game_play_by_play
        end

        def game_id
          game_play_by_play['id']
        end

        def away
          game_play_by_play['away'] || {}
        end

        def away_team_id
          away['id']
        end

        def home
          game_play_by_play['home'] || {}
        end

        def periods
          @periods ||= build_periods || []
        end

        def has_periods?
          periods.count > 0
        end

        def events
          (periods || []).map(&:events).flatten
        end

        private

        attr_reader :game_play_by_play

        def build_periods
          game_play_by_play.
            dig('periods').
              map { |attributes| Models::Period.new(game_id: game_id, attributes: attributes) }
        end
      end
    end
  end
end
