module Sportradar
  module Nfl
    class PlayByPlay < Sportradar::Nfl::GameRequest
      def path
        "#{game_path}/pbp.json"
      end
    end
  end
end
