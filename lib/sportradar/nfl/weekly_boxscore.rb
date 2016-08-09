module Sportradar
  module Nfl
    class WeeklyBoxscore < Sportradar::Nfl::WeeklySchedule
      def path
        "#{week_path}/boxscore.json"
      end
    end
  end
end
