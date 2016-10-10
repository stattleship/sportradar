module Sportradar
  module Nhl
    module Models
      class Penalty < Event
        def to_s
          "#{super} - #{minutes} mins - #{label}"
        end

        def duration
          @attributes.dig('duration')
        end

        def minutes
          duration.to_i
        end

        def name
          ActiveSupport::Inflector.parameterize(penalty_type)
        end

        def penalty_type
          @attributes.dig('penalty_type')
        end
        alias_method :label, :penalty_type

        def player_id
          # penalty on
        end

        def seconds
          minutes * 60
        end

        def team_penalty
          false
        end

        def to_h
          {
            id: id,
            game_id: game_id,
            player_id: player_id,
            team_id: team_id,
            minutes: minutes,
            name: name,
            period_number: period_number,
            period_seconds: period_seconds,
            sports_ml_key: id,
            team_penalty: team_penalty,
            time_code: time_code,
            seconds: seconds,
          }
        end
      end
    end
  end
end
