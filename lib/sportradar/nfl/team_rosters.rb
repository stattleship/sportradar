module Sportradar
  module Nfl
    class TeamRosters < Sportradar::Nfl::TeamsRequest
      def self.fetch
        new.fetch
      end

      def fetch
        team_rosters = []

        team_abbreviations.each do |team_abbreviation|
          team_rosters << TeamRoster.new(team_abbreviation: team_abbreviation).fetch
        end

        { 'teams' => team_rosters }
      end

      def self.perform
        new.perform
      end

      def perform
        team_abbreviations.each do |team_abbreviation|
          rosters << TeamRoster.new(team_abbreviation: team_abbreviation).save
        end
      end
    end
  end
end
