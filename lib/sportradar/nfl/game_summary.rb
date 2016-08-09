module Sportradar
  module Nfl
    class GameSummary < Sportradar::Nfl::GameRequest
      def path
        "#{game_path}/summary.json"
      end
    end
  end
end
