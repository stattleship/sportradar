module Sportradar
  module Nfl
    module Models
      class PlaySummary < Play
        def initialize(attributes:)
          @attributes = attributes
        end

        def to_s
          summary
        end

        def game_id
          @attributes['game']
        end

        def team
          controller
        end

        def quarter_number
          @attributes['quarter']
        end

        def controller
          @attributes['controller']
        end

        def players
          @attributes['players']
        end

        def end_situation_down
          @attributes.dig('end_situation', 'down')
        end

        def end_situation_side
          @attributes.dig('end_situation', 'side')
        end

        def end_situation_team
          @attributes.dig('end_situation', 'team')
        end

        def end_situation_yard_line
          @attributes.dig('end_situation', 'yard_line')
        end

        def end_situation_yards_to_first_down
          @attributes.dig('end_situation', 'yfd')
        end

        def start_situation_down
          @attributes.dig('start_situation', 'down')
        end

        def start_situation_side
          @attributes.dig('start_situation', 'side')
        end

        def start_situation_team
          @attributes.dig('start_situation', 'team')
        end

        def start_situation_yard_line
          @attributes.dig('start_situation', 'yard_line')
        end

        def start_situation_yards_to_first_down
          @attributes.dig('start_situation', 'yfd')
        end

        def scoring_team
          @attributes.dig('score', 'team')
        end

        def score_type
          @attributes.dig('score', 'type')
        end

        def points_scored
          @attributes.dig('score', 'points')
        end

        def is_current_drive_team?
          if controller && team
            controller == team
          end
        end
      end
    end
  end
end
