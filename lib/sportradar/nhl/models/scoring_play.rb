module Sportradar
  module Nhl
    module Models
      class ScoringPlay < Event
        def points
          1
        end

        def scored_at
          wall_clock
        end

        def scoring_method
          if empty_net? || penalty_goal? || shootout_goal?
            'goal'
          else
            event_type
          end
        end

        def scoring_type
          case strength
          when 'even'
            'ev'
          when 'powerplay'
            'pp'
          when 'shorthanded'
            'sh'
          else
            if shootout_goal?
              'so'
            else
              strength
            end
          end
        end

        def scoring_how
          event_type
        end

        def empty_net
          event_type == 'emptynetgoal'
        end

        def empty_net?
          empty_net
        end

        def penalty_goal
          event_type == 'penaltygoal'
        end

        def penalty_goal?
          penalty_goal
        end

        def shootout_goal?
          event_type == 'shootoutgoal'
        end

        def to_h
          {
            id: id,
            game_id: game_id,
            points: points,
            scored_at: scored_at,
            scoring_method: scoring_method,
            scoring_type: scoring_type,
            empty_net: empty_net,
          }.compact
        end
      end
    end
  end
end
