module Sportradar
  module Nfl
    class SeasonStatistics < Sportradar::Nfl::TeamsRequest
      def initialize(year:, interval_type:)
        @year = year || Date.today.strftime('%Y')
        @interval_type = interval_type || 'reg'
      end

      def self.fetch(year:, interval_type:)
        new(year: year, interval_type: interval_type).fetch
      end

      def fetch
        team_statistics = []

        team_ids.each do |team_id|
          team_statistics << TeamStatistics.new(year: year,
                                                interval_type: interval_type,
                                                team_id: team_id).fetch
        end

        {
          'teams' => team_statistics ,
          'requested_at' => Time.current,
          'requested_on' => Time.current.to_date,
        }
      end

      def self.perform(year:, interval_type:)
        new(year: year, interval_type: interval_type).perform
      end

      def perform
        team_ids.each do |team_id|
          TeamStatistics.new(year: year,
                             interval_type: interval_type,
                             team_id: team_id).save
        end

        nil
      end

      private

      attr_reader :interval_type, :year
    end
  end
end
