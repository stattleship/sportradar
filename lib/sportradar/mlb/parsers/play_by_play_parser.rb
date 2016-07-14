module Sportradar
  module Mlb
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
        private

        attr_reader :game_play_by_play

        def build_play_by_play(team_id:, event:)
          Sportradar::Mlb::Models::PlayByPlay.new(game_id: game_id,
                                                  team_id: team_id,
                                                  event: event)
        end
      end
    end
  end
end
