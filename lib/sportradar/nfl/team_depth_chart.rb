module Sportradar
  module Nfl
    class TeamDepthChart < Sportradar::ApiRequest
      def initialize(team_abbreviation:)
        @team_abbreviation = team_abbreviation
      end

      def path
        "teams/#{team_abbreviation}/depthchart.json"
      end

      private

      attr_reader :team_abbreviation
    end
  end
end
