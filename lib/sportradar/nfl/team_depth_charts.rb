module Sportradar
  module Nfl
    class TeamDepthCharts < Sportradar::Nfl::TeamsRequest
      def self.perform
        new.perform
      end

      def perform
        team_abbreviations.each do |team_abbreviation|
          TeamDepthChart.new(team_abbreviation: team_abbreviation).save
        end

        nil
      end
    end
  end
end
