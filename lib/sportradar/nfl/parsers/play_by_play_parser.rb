module Sportradar
  module Nfl
    module Parsers
      class PlayByPlayParser
        def initialize(game_play_by_play: {})
          @game_play_by_play = game_play_by_play['game'] || game_play_by_play
        end

        def game_id
          game_play_by_play['id']
        end

        def away
          game_play_by_play['away_team'] || {}
        end

        def away_team_id
          away['id']
        end

        def home
          game_play_by_play['home_team'] || {}
        end

        def quarters
          @quarters ||= build_quarters || []
        end

        def has_quarters?
          quarters.count > 0
        end

        def drives
          (quarters || []).map(&:drives).flatten
        end

        def plays
          (drives || []).map(&:plays)
        end

        def events
          (drives || []).map(&:events)
        end

        private

        attr_reader :game_play_by_play

        def build_quarters
          game_play_by_play.
            dig('quarters').
              map { |attributes| Models::Quarter.new(game_id: game_id, attributes: attributes) }
        end
      end
    end
  end
end
