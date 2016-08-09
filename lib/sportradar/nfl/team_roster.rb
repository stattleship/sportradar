module Sportradar
  module Nfl
    class TeamRoster < Sportradar::ApiRequest
      def initialize(team_abbreviation:)
        @team_abbreviation = team_abbreviation
      end

      def path
        "teams/#{team_abbreviation}/roster.json"
      end

      private

      attr_reader :team_abbreviation
    end
  end
end
