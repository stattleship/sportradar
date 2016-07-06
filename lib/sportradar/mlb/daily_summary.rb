module Sportradar
  module Mlb
    class DailySummary < Sportradar::DailyApiRequest
      def initialize(date: Date.today)
        @date = date
      end

      def path
        "games/#{year}/#{month}/#{day}/summary.json"
      end
    end
  end
end
