module Sportradar
  module Nfl
    module Models
      class PlayAdvancement
        def initialize(play:, attributes:)
          @play = play
          @attributes = attributes
        end

        def to_s
          [
            type,
            from_side_team,
            from_yard_line,
            to_side_team,
            to_yard_line,
            yards
          ].compact.
            join(' ')
        end

        def id
          @play.id
        end

        def sequence
          @attributes['sequence']
        end

        def type
          @attributes['type']
        end

        def team
          @attributes['team']
        end

        def yards
          @attributes['yards']
        end

        def from_side_team
          @attributes.dig('from', 'side')
        end

        def from_yard_line
          @attributes.dig('from', 'yard_line')
        end

        def to_side_team
          @attributes.dig('to', 'side')
        end

        def to_yard_line
          @attributes.dig('to', 'yard_line')
        end
      end
    end
  end
end
