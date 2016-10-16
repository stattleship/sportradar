module Sportradar
  module Nba
    module Models
      class ScoringPlayer < PlayPlayerStat
        def role
          type
        end

        def scoring_play_id
          event.id
        end

        def to_s
          "#{super} - #{role}"
        end
      end
    end
  end
end
