module Sportradar
  module Nfl
    class WeeklyLeaders < Sportradar::Nfl::WeeklySchedule
      def path
        "#{week_path}/leaders.json"
      end
    end
  end
end
