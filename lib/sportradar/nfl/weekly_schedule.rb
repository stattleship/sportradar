module Sportradar
  module Nfl
    class WeeklySchedule < Sportradar::Nfl::LeagueSchedule
      def initialize(year: nil, interval_type: nil, week: 1)
        super(year: year, interval_type: interval_type)
        @week = week
      end

      def path
        "#{year}/#{interval_type}/#{week}/schedule.json"
      end

      private

      attr_reader :week
    end
  end
end
