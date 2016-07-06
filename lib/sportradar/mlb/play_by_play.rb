module Sportradar
  module Mlb
    class PlayByPlay < Sportradar::ApiRequest
      def initialize(event_id:)
        @event_id = event_id
      end

      def path
        "games/#{event_id}/pbp.json"
      end

      private

      attr_reader :event_id
    end
  end
end
