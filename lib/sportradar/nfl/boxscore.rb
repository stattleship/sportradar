module Sportradar
  module Nfl
    class Boxscore < Sportradar::Nfl::GameRequest
      def path
        "#{game_path}/boxscore.json"
      end
    end
  end
end
