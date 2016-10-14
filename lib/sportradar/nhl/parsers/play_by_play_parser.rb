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

        def penalties
          (periods || []).map(&:penalties).flatten
        end

        def plays
          (periods || []).map(&:plays).flatten
        end

        def scoring_plays
          (periods || []).map(&:scoring_plays).flatten
        end

        def stoppages
          (periods || []).map(&:stoppages).flatten
        end

        private

        attr_reader :game_play_by_play

        def game_play_by_play_periods
          game_play_by_play.dig('periods') || []
        end

        def build_periods
          game_play_by_play_periods.
            map { |attributes| Models::Period.new(game_id: game_id, attributes: attributes) }
        end
      end
    end
  end
end
