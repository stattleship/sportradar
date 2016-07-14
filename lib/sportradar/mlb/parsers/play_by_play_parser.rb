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

        def innings
          game_play_by_play['innings'] || []
        end

        def at_bats
          @at_bats = []

          innings.each do |inning|
            (inning['halfs'] || []).each do |halfs|
              (halfs['events'] || []).each do |event|
                if event.has_key?('at_bat')
                  @at_bats << (event['at_bat'] || {}).merge('time_code' => { 'number' => inning['number'],
                                                                             'inning' => inning['sequence'],
                                                                             'half' => halfs['half'],
                                                                             'sequence' => inning['sequence'] })
                end
              end
            end
          end

          @at_bats
        end

        def pitches
          @pitches = []
          at_bats.each do |at_bat|
            (at_bat['events'] || []).each do |event|
              if event['type'] == 'pitch'
                pitch = event['pitcher'].merge(hitter_id: at_bat['hitter_id'],
                                               pitch_outcome_type: event['outcome_id']).
                          merge(at_bat['time_code']).
                          merge(pitch_outcome: Models::PitchOutcome.new(outcome: event['outcome_id']).to_s)
                @pitches << pitch
              end
            end
          end

          @pitches
        end

        def putouts
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
