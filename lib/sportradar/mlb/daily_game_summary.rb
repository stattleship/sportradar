module Sportradar
  module Mlb
    class DailyGameSummary < Sportradar::Mlb::DailySchedule
      def perform
        fetch['league']['games'].each do |game|
          Sportradar::Mlb::GameSummary.new(event_id: game['id']).save
        end
      end
    end
  end
end
