module Sportradar
  module Nhl
    module Models
      class Period
        def initialize(game_id:, attributes:)
          @game_id = game_id
          @attributes = attributes
          build_events
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
          @events ||= []
        end

        def events_data
          @actions ||= @attributes.dig('events') || []
        end

        def penalties
          @penalties ||= []
        end

        def plays
          @plays ||= []
        end

        def scoring_plays
          @scoring_plays ||= []
        end

        def stoppages
          @stoppages ||= []
        end

        private

        def build_events
          events_data.each do |event_data|
            event = Models::Event.new(period: self, attributes: event_data)
            events << event
            plays << event if event.play?
            stoppages << event if event.stoppage?
            penalties << Models::Penalty.new(period: self, attributes: event_data) if event.penalty?
            scoring_plays << Models::ScoringPlay.new(period: self, attributes: event_data) if event.scoring_play?
          end
        end
      end
    end
  end
end
