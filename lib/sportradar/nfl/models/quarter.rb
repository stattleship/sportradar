module Sportradar
  module Nfl
    module Models
      class Quarter
        def initialize(game_id:, attributes:)
          @game_id = game_id
          @attributes = attributes
        end

        def to_s
          "Quarter #{number}"
        end

        def abbreviation
          "Q#{number}"
        end

        def game_id
          @game_id
        end

        def number
          @attributes['number'] || 0
        end

        def pbp
          @attributes['pbp']
        end

        def drives
          @drives ||= build_drives
        end

        private

        def build_drives
          pbp.each_with_object([]) do |event, _drives|
            if event['type'] == 'drive'
              _drives << Models::Drive.new(quarter: self, attributes: event)
            end
          end
        end
      end
    end
  end
end
