module Sportradar
  module Nfl
    class GameInjuries < Sportradar::Nfl::GameRequest
      def path
        "#{game_path}/injuries.json"
      end
    end
  end
end
