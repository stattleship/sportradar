module Sportradar
  module Nhl
    module Models
      class Period
        def initialize(game_id:, attributes:)
          @game_id = game_id
          @attributes = attributes
        end

        def to_s
          "Period #{number}"
        end

        def abbreviation
          "#{number}"
        end

        def game_id
          @game_id
        end

        def id
          @id
        end

        def number
          @attributes['number'] || 0
        end

        def events
          @events ||= build_events || []
        end

        def actions
          @actions ||= @attributes.dig('events') || []
        end

        private

        def build_events
          actions.each_with_object([]) do |action, _events|
            if action['event_type'] != 'gamesetup'
              _events << Models::Event.new(period: self, attributes: action)
            end
          end
        end
      end
    end
  end
end
