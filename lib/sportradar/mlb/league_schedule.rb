module Sportradar
  module Mlb
    class LeagueSchedule < Sportradar::ApiRequest
      def initialize(year: nil, interval_type: nil)
        @year = year || Date.today.strftime('%Y')
        @interval_type = interval_type || 'reg'
      end

      def path
        "games/#{year}/#{interval_type}/schedule.json"
      end

      private

      attr_reader :interval_type, :year
    end
  end
end
