module Sportradar
  module Nfl
    class GameDepthChart < Sportradar::Nfl::GameRequest
      def path
        "#{game_path}/depthchart.json"
      end
    end
  end
end
