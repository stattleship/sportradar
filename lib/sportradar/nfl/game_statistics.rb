module Sportradar
  module Nfl
    class GameStatistics < Sportradar::Nfl::GameRequest
      def path
        "#{game_path}/statistics.json"
      end
    end
  end
end
