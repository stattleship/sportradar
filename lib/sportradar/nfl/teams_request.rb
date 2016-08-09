module Sportradar
  module Nfl
    class TeamsRequest
      private

      def team_abbreviations
        teams.map { |team| team['id'] }.sort
      end

      def hierarchy
        _hierarchy ||= LeagueHierarchy.new.fetch
      end

      def conferences
        conferences ||= hierarchy['conferences']
      end

      def divisions
        @divisions = []

        conferences.each do |conference|
          @divisions << conference['divisions']
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
