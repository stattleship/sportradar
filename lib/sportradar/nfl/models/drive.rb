module Sportradar
  module Nfl
    module Models
      class Drive
        def initialize(quarter:, attributes:)
          @quarter = quarter
          @attributes = attributes
        end

        def to_s
          "#{quarter.to_s} #{clock} - #{sequence}"
        end

        def quarter
          @quarter
        end

        def quarter_number
          @quarter.quarter
        end

        def clock
          @attributes['clock']
        end

        def sequence
          @attributes['sequence']
        end

        def id
          @attributes['id']
        end

        def team
          @attributes['team']
        end

        def type
          @attributes['type']
        end

        def actions
          @actions ||= @attributes.dig('actions') || []
        end

        def plays
          @plays || build_plays || []
        end

        def number_of_plays
          plays.count
        end

        def events
          @events || build_events || []
        end

        private

        def build_plays
          actions.each_with_object([]) do |action, _plays|
            if action['type'] == 'play'
              _plays << Models::Play.new(drive: self, attributes: action)
            end
          end
        end

        def build_events
          actions.each_with_object([]) do |action, _events|
            if action['type'] != 'play'
              _events << Models::Event.new(drive: self, attributes: action)
            end
          end
        end
      end
    end
  end
end
