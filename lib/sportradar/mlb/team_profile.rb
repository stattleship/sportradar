module Sportradar
  module Mlb
    class TeamProfile < Sportradar::ApiRequest
      def initialize(team_id:)
        @team_id = team_id
      end

      def path
        "teams/#{team_id}/profile.json"
      end

      private

      attr_reader :team_id
    end
  end
end
