module Sportradar
  module Nfl
    class ExtendedBoxscore < Sportradar::Nfl::GameRequest
      def path
        "#{game_path}/extended-boxscore.json"
      end
    end
  end
end
