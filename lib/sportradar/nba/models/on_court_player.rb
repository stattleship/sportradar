module Sportradar
  module Nba
    module Models
      class OnCourtPlayer
        def initialize(attributes = {})
          @attributes = attributes
        end

        def to_s
          [].tap do |sentence_parts|
            sentence_parts << event_id
            sentence_parts << player_id
            sentence_parts << full_name
            sentence_parts << team_id
            sentence_parts << team_name
          end.join(' - ')
        end

        def event_id
          @attributes.dig('event_id')
        end

        def player_id
          @attributes.dig('player_id')
        end

        def full_name
          @attributes.dig('full_name')
        end

        def team_id
          @attributes.dig('team_id')
        end

        def team_name
          @attributes.dig('team_name')
        end
      end
    end
  end
end
