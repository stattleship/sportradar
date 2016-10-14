module Sportradar
  module Nba
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
          json['quarter'].to_i
        end

        def scheduled_at
          json['scheduled'] && json['scheduled'].to_datetime
        end
        alias_method :started_at, :scheduled_at

        def ended_at
          if over?
            scheduled_at + duration_secs.seconds
          end
        end
        alias_method :completed, :ended_at

        def over?
          status == 'closed'
        end

        def status
          json['status']
        end

        def lead_changes
          json['lead_changes'] || 0
        end

        def times_tied
          json['times_tied'] || 0
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
            lead_changes: lead_changes,
            times_tied: times_tied,
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
          json['duration']
        end

        def duration_secs
          begin
            if duration && duration.include?(':')
              hours, mins = duration.split(':').map(&:to_i)
              Time.parse("#{hours}:#{mins}:00").
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
            points_scored_total: home_team_json['points'],
          }.merge(home_team_scoring_quarters).
            compact
        end

        def home_team_scoring_quarters
          team_scoring_quarters(data: home_team_scoring_data)
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
            points_scored_total: away_team_json['points'],
          }.merge(away_team_scoring_quarters).
            compact
        end

        def away_team_scoring_quarters
          team_scoring_quarters(data: away_team_scoring_data)
        end

        def team_scoring_quarters(data:)
          {}.tap do |scoring_quarters|
            overtime_points = 0
            scoring_quarters[:points_overtime] = overtime_points

            data.map do |scoring_data|
              if quarter = scoring_data['sequence'].to_i
                if quarter > 0 && quarter <= 4
                  key = "points_quarter_#{quarter}".to_sym
                  scoring_quarters[key] =
                    scoring_data['points'].to_i
                elsif quarter > 4
                  quarter_type = (scoring_data['type'] || 'quarter').downcase
                  if quarter_type == 'overtime'
                    key = "points_#{quarter_type}_#{scoring_data['number'].to_i}".to_sym
                    scoring_quarters[key] =
                      scoring_data['points'].to_i
                    overtime_points += scoring_data['points'].to_i
                    scoring_quarters[:points_overtime] = overtime_points
                  end
                end
              end
            end
            scoring_quarters[:points_overtime] = overtime_points
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
          home_team_scoring[:points_scored_total] || 0
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
          away_team_scoring[:points_scored_total] || 0
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
