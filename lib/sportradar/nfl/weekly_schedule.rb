module Sportradar
  module Nfl
    class WeeklySchedule < Sportradar::Nfl::LeagueSchedule
      def initialize(year: nil, interval_type: nil, week: 1)
        super(year: year, interval_type: interval_type)
        @week = week
      end

      def week_path
        "#{year}/#{interval_type}/#{week}"
      end

      def path
        "#{week_path}/schedule.json"
      end

      private

      attr_reader :week
    end
  end
end
