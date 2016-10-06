module Sportradar
  module Nhl
    module Parsers
      class BoxscoreParser
        def initialize(json: {})
          @json = json['game'] || json
        end

        def game_id
          json['id']
        end

        def period
          json['period'].to_i
        end

        def clock
          json['clock']
        end

        def duration
          json['total_game_duration']
        end

        def ended_at
          json['end_time'] && json['end_time'].to_datetime
        end

        def status
          json['status']
        end

        def clock_attributes
          {
            clock: clock,
            clock_secs: clock_secs,
            duration: duration_secs,
            period: period,
            ended_at: ended_at,
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

        def duration_secs
          begin
            if total_game_duration && total_game_duration.include?(':')
              mins, secs = total_game_duration.split(':').map(&:to_i)
              Time.parse("00:#{mins}:#{secs}").
                 seconds_since_midnight.to_i
            end
          rescue => e
            puts e
            return 0
          end
        end

        def home_team_json
          json['home'] || {}
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
          }.merge(home_team_scoring_periods).
            compact
        end

        def home_team_scoring_periods
          team_scoring_periods(data: home_team_scoring_data)
        end

        def away_team_json
          json['away'] || {}
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
          }.merge(away_team_scoring_periods).
            compact
        end

        def away_team_scoring_periods
          team_scoring_periods(data: away_team_scoring_data)
        end

        def team_scoring_periods(data:)
          {}.tap do |scoring_periods|
            overtime_points = 0
            data.map do |scoring_data|
              if period = scoring_data['period'].to_i
                if period > 0 && period <= 3
                  key = "goals_period_#{period}".to_sym
                  scoring_periods[key] =
                    scoring_data['points'].to_i
                elsif period > 3
                  key = "goals_overtime_#{period - 3}".to_sym
                  scoring_periods[key] =
                    scoring_data['points'].to_i
                  overtime_points += scoring_data['points'].to_i
                end
              end
            end
            scoring_periods[:goals_overtime] = overtime_points
          end
        end

        private

        attr_reader :json
      end
    end
  end
end
