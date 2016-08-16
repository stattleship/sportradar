module Sportradar
  module Mlb
    class TeamsRequest
      private

      def team_ids
        teams.map { |team| team['id'] }.sort
      end

      def hierarchy
        _hierarchy ||= LeagueHierarchy.new.fetch
      end

      def leagues
        leagues ||= hierarchy['leagues']
      end

      def divisions
        @divisions = []

        leagues.each do |league|
          @divisions << league['divisions']
        end

        @divisions.flatten
      end

      def teams
        @teams = []

        divisions.each do |division|
          @teams << division['teams']
        end

        @teams.flatten
      end
    end
  end
end
