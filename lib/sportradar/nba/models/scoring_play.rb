module Sportradar
  module Nba
    module Models
      class ScoringPlay < Event
        def scored_at
          updated_at
        end

        def scoring_method
          shot_type
        end

        def scoring_type
          event_type
        end

        def scoring_how
          event_type
        end

        def to_h
          {
            id: id,
            game_id: game_id,
            points: points,
            scored_at: scored_at,
            scoring_method: scoring_method,
            scoring_type: scoring_type,
          }.compact
        end
      end
    end
  end
end
