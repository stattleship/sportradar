module Sportradar
  module Mlb
    class DailyBoxscore < Sportradar::DailyApiRequest
      def initialize(date: Date.today)
        @date = date
      end

      def path
        "games/#{year}/#{month}/#{day}/boxscore.json"
      end
    end
  end
end
