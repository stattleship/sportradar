module Sportradar
  module Nba
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

        def quarters
          @quarters ||= build_quarters || []
        end

        def has_quarters?
          quarters.count > 0
        end

        def events
          (quarters || []).map(&:events).flatten
        end

        def fouls
          (quarters || []).map(&:fouls).flatten
        end

        def scoring_plays
          (quarters || []).map(&:scoring_plays).flatten
        end

        def stoppages
          (quarters || []).map(&:stoppages).flatten
        end

        def on_court_players
          (quarters || []).map(&:on_court_players).flatten
        end

        private

        attr_reader :game_play_by_play

        def game_play_by_play_quarters
          game_play_by_play.dig('periods') || []
        end

        def build_quarters
          game_play_by_play_quarters.
            map { |attributes| Models::Quarter.new(game_id: game_id, attributes: attributes) }
        end
      end
    end
  end
end
