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

        def attendance
          json['attendance']
        end

        def period
          json['period'].to_i
        end

        def scheduled_at
          json['scheduled'] && json['scheduled'].to_datetime
        end

        def started_at
          json['start_time'] && json['start_time'].to_datetime
        end

        def ended_at
          json['end_time'] && json['end_time'].to_datetime
        end
        alias_method :completed, :ended_at

        def over?
          status == 'closed'
        end

        def status
          json['status']
        end

        def clock
          json['clock']
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

        def duration
          json['total_game_duration']
        end

        def duration_secs
          begin
            if duration && duration.include?(':')
              mins, secs = duration.split(':').map(&:to_i)
              hours = mins / 60
              mins = mins % 60
              Time.parse("#{hours}:#{mins}:#{secs}").
                 seconds_since_midnight.to_i
            end
          rescue => e
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
            goals: home_team_json['points'],
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
            goals: away_team_json['points'],
          }.merge(away_team_scoring_periods).
            compact
        end

        def away_team_scoring_periods
          team_scoring_periods(data: away_team_scoring_data)
        end

        def team_scoring_periods(data:)
          {}.tap do |scoring_periods|
            overtime_points = 0
            scoring_periods[:goals_overtime] = overtime_points
            scoring_periods[:goals_shootout] = 0

            data.map do |scoring_data|
              if period = scoring_data['sequence'].to_i
                if period > 0 && period <= 3
                  key = "goals_period_#{period}".to_sym
                  scoring_periods[key] =
                    scoring_data['points'].to_i
                elsif period > 3
                  period_type = (scoring_data['type'] || 'period').downcase
                  if period_type == 'overtime'
                    key = "goals_#{period_type}_#{scoring_data['number'].to_i}".to_sym
                    scoring_periods[key] =
                      scoring_data['points'].to_i
                    overtime_points += scoring_data['points'].to_i
                    scoring_periods[:goals_overtime] = overtime_points
                  elsif period_type == 'shootout'
                    key = "goals_#{period_type}".to_sym
                    scoring_periods[key] =
                      scoring_data['points'].to_i
                  end
                end
              end
            end
            scoring_periods[:goals_overtime] = overtime_points
          end
        end

        def game_scoring_attributes
          {
            attendance: attendance,
            home_team_outcome: home_team_outcome,
            home_team_score: home_team_score,
            away_team_outcome: away_team_outcome,
            away_team_score: away_team_score,
          }
        end

        def home_team_score
          home_team_scoring[:goals] || 0
        end

        def home_team_outcome
          if over?
            if home_team_score > away_team_score
              'win'
            elsif home_team_score < away_team_score
              'loss'
            else
              'tie'
            end
          else
            'undecided'
          end
        end

        def away_team_score
          away_team_scoring[:goals] || 0
        end

        def away_team_outcome
          if over?
            if home_team_score < away_team_score
              'win'
            elsif home_team_score > away_team_score
              'loss'
            else
              'tie'
            end
          else
            'undecided'
          end
        end

        def game_attributes
          clock_attributes.merge(game_scoring_attributes).
            compact
        end

        private

        attr_reader :json
      end
    end
  end
end
