module Sportradar
  module Nfl
    class TeamRosters < Sportradar::Nfl::TeamsRequest
      def self.fetch
        new.fetch
      end

      def fetch
        team_rosters = []

        team_ids.each do |team_ids|
          team_rosters << TeamRoster.new(team_abbreviation: team_ids).fetch
        end

        { 'teams' => team_rosters }
      end

      def self.perform
        new.perform
      end

      def perform
        team_ids.each do |team_ids|
          rosters << TeamRoster.new(team_abbreviation: team_ids).save
        end
      end
    end
  end
end
