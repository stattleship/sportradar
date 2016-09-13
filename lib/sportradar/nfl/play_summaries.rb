module Sportradar
  module Nfl
    class PlaySummaries < Sportradar::Nfl::PlayByPlay
      def self.perform(year: nil,
                       interval_type: nil,
                       week: 1,
                       away_team_abbreviation:,
                       home_team_abbreviation:)
        new(year: year,
            interval_type: interval_type,
            week: week,
            away_team_abbreviation: away_team_abbreviation,
            home_team_abbreviation: home_team_abbreviation).perform
      end

      def perform
        (quarters || []).each do |quarter|
          (quarter['pbp'] || []).each do |pbp|
            (pbp['actions'] || []).each do |action|
              next unless action['type'] == 'play'

              PlaySummary.new(week: @week,
                              year: @year,
                              interval_type: @interval_type,
                              away_team_abbreviation: @away_team_abbreviation,
                              home_team_abbreviation: @home_team_abbreviation,
                              play_id: action['id']).save
            end
          end
        end

        nil
      end

      private

      def quarters
        fetch['quarters'] || []
      end
    end
  end
end
