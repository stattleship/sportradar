module Sportradar
  module Mlb
    class DailySchedule < Sportradar::DailyApiRequest
      def initialize(date: Date.today)
        @date = date
      end

      def path
        "games/#{year}/#{month}/#{day}/schedule.json"
      end
    end
  end
end
