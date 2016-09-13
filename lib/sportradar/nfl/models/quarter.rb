module Sportradar
  module Nfl
    module Models
      class Quarter
        def initialize(attributes:)
          @attributes = attributes
        end

        def to_s
          "Quarter #{number}"
        end

        def abbreviation
          "Q#{number}"
        end

        def number
          @attributes['number']
        end

        def pbp
          @attributes['pbp']
        end

        def drives
          @drives ||= build_drives
        end

        private

        def build_drives
          sequence = 1

          pbp.each_with_object([]) do |event, _drives|
            if event['type'] == 'drive'
              event.merge!('sequence' => sequence)
              _drives << Models::Drive.new(quarter: self, attributes: event)
              sequence = sequence + 1
            end
          end
        end
      end
    end
  end
end
