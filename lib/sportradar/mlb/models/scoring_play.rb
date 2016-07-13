module Sportradar
  module Mlb
    module Models
      class ScoringPlay
        def initialize(game_id:, team_id:, event:)
          @game_id = game_id
          @team_id = team_id
          @event = event
        end

        def id
          event['id']
        end

        def hitter_id
          event['hitter_id']
        end

        def hitter_outcome
          event['hitter_outcome']
        end

        def inning
          event['inning']
        end

        def oridinal_inning
          ActiveSupport::Inflector.ordinalize(inning)
        end

        def inning_half
          event['inning_half']
        end

        def inning_half_label
          case inning_half
          when 'B'
            'Bottom of'
          when 'T'
            'Top of'
          else
            ''
          end
        end

        def inning_label
          if inning
            "#{inning_half_label} #{oridinal_inning}"
          end
        end

        def pitcher_id
          event['pitcher_id']
        end

        def runners
          (event['runners'] || []).map do |runner|
            Runner.new(runner: runner)
          end
        end

        def runner_ids
          (runners || []).map(&:id)
        end

        def play_type
          event['type']
        end

        def pitch?
            play_type == 'pitch'
        end

        def period_number
          inning
        end

        def points
          runners.count
        end

        def scored_at
        end

        def scoring_conversion
        end

        def scoring_conversion_points
        end

        def scoring_method
          PitchOutcome.new(outcome: hitter_outcome).
            to_s
        end

        def scoring_how
          play_type
        end

        def scoring_type
          hitter_outcome
        end

        def time_code
          "#{inning_half}#{inning}"
        end

        def period_seconds
        end

        def empty_net
        end

        def conversion
        end

        def conversion_points
        end

        def pitcher_role
          {
            player_id: pitcher_id,
            player_info: nil,
            role: 'pitcher',
          }
        end

        def hitter_role
          {
            player_id: hitter_id,
            player_info: nil,
            role: 'hitter',
          }
        end

        def runner_roles
          runners.map do |runner|
            {
              player_id: runner.id,
              player_info: runner,
              role: 'runner',
            }
          end
        end

        def scoring_players
          [
            pitcher_role,
            hitter_role,
            runner_roles,
          ].compact.
            flatten
        end

        attr_reader :event, :game_id, :team_id
      end
    end
  end
end
