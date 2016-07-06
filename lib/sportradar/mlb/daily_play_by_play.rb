module Sportradar
  module Mlb
    class DailyPlayByPlay < Sportradar::Mlb::DailySchedule
      def perform
        fetch['league']['games'].each do |game|
          Sportradar::Mlb::PlayByPlay.new(event_id: game['id']).save
        end
      end
    end
  end
end
