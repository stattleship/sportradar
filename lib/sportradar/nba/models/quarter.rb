module Sportradar
  module Nba
    module Models
      class Quarter
        def initialize(game_id:, attributes:)
          @game_id = game_id
          @attributes = attributes
          build_events
        end

        def to_s
          "Quarter #{number}"
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
          @events ||= []
        end

        def events_data
          @actions ||= @attributes.dig('events') || []
        end

        def fouls
          events.collect(&:foul).compact
        end

        def scoring_plays
          events.collect(&:scoring_play).compact
        end

        def stoppages
          events.collect(&:stoppage).compact
        end

        def on_court_players
          events.map(&:on_court_players).flatten
        end

        private

        def build_events
          events_data.each do |event_data|
            events << Models::Event.new(quarter: self, attributes: event_data)
          end
        end
      end
    end
  end
end
