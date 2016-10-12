module Sportradar
  module Nba
    class TeamRosters < Sportradar::Nba::TeamsRequest
      def self.fetch
        new.fetch
      end

      def fetch
        team_rosters = []

        team_ids.each do |team_ids|
          team_rosters << TeamRoster.new(team_id: team_ids).fetch
        end

        { 'teams' => team_rosters }
      end

      def self.perform
        new.perform
      end

      def perform
        team_ids.each do |team_id|
          TeamRoster.new(team_id: team_id).save
        end
      end
    end
  end
end
