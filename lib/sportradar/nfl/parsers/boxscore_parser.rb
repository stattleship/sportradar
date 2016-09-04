module Sportradar
  module Nfl
    module Parsers
      class BoxscoreParser
        def initialize(json: {})
          @json = json['game'] || json
        end

        def game_id
          json['id']
        end

        def quarter
          json['quarter'].to_i
        end

        def clock
          json['clock']
        end

        def completed
          json['completed'] && json['completed'].to_datetime
        end

        def status
          json['status']
        end

        def clock_attributes
          {
            clock: clock,
            clock_secs: clock_secs,
            period: quarter,
            ended_at: completed,
            status: status,
          }.compact
        end

        def clock_secs
          begin
            if clock && clock.include?(':')
              mins, secs = clock.split(':').map(&:to_i)
              Time.parse("00:#{mins}:#{secs}").
                 seconds_since_midnight.to_i
            end
          rescue => e
            puts e
            return 0
          end
        end

        def home_team_json
          json['home_team'] || {}
        end

        def home_team_id
          home_team_json['id']
        end

        def home_team_scoring_data
          home_team_json['scoring'] || {}
        end

        def home_team_scoring
          {
            points: home_team_json['points'],
            remaining_challenges: home_team_json['remaining_challenges'],
            remaining_timeouts: home_team_json['remaining_timeouts'],
          }.merge(home_team_scoring_quarters).
            compact
        end

        def home_team_scoring_quarters
          team_scoring_quarters(data: home_team_scoring_data)
        end

        def away_team_json
          json['away_team'] || {}
        end

        def away_team_id
          away_team_json['id']
        end

        def away_team_scoring_data
          away_team_json['scoring'] || {}
        end

        def away_team_scoring
          {
            points: away_team_json['points'],
            remaining_challenges: away_team_json['remaining_challenges'],
            remaining_timeouts: away_team_json['remaining_timeouts'],
          }.merge(away_team_scoring_quarters).
            compact
        end

        def away_team_scoring_quarters
          team_scoring_quarters(data: away_team_scoring_data)
        end

        def team_scoring_quarters(data:)
          {}.tap do |scoring_quarters|
            overtime_points = 0
            data.map do |scoring_data|
              if quarter = scoring_data['quarter'].to_i
                if quarter > 0 && quarter <= 4
                  key = "points_quarter_#{quarter}".to_sym
                  scoring_quarters[key] =
                    scoring_data['points'].to_i
                elsif quarter > 4
                  key = "points_overtime_#{quarter - 4}".to_sym
                  scoring_quarters[key] =
                    scoring_data['points'].to_i
                  overtime_points += scoring_data['points'].to_i
                end
              end
            end
            scoring_quarters[:points_overtime] = overtime_points
          end
        end

        private

        attr_reader :json
      end
    end
  end
end
