module Sportradar
  module Nfl
    class GameRoster < Sportradar::Nfl::GameRequest
      def path
        "#{game_path}/roster.json"
      end
    end
  end
end
