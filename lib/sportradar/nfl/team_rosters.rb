module Sportradar
  module Nfl
    class TeamRosters < Sportradar::Nfl::TeamsRequest
      def self.perform
        new.perform
      end

      def perform
        team_abbreviations.each do |team_abbreviation|
          TeamRoster.new(team_abbreviation: team_abbreviation).save
        end

        nil
      end
    end
  end
end
