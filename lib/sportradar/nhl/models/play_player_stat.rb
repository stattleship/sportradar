module Sportradar
  module Nhl
    module Models
      class PlayPlayerStat
        def initialize(event:, attributes:)
          @event = event
          @attributes = attributes
        end

        def to_s
          [
            period_abbreviation,
            clock,
            description,
            team_name,
            full_name,
            stat,
          ].join(' ')
        end

        def event
          @event
        end

        def event_id
          @event.id
        end

        def description
          @event.description
        end

        def period
          @event.period
        end

        def period_abbreviation
          period.abbreviation
        end

        def period_number
          period.number
        end

        def period_sequence
          period.sequence
        end

        def period_type
          period.type
        end

        def clock
          @event.clock
        end

        def player
          @attributes.dig('player') || {}
        end

        def player_id
          player.dig('id')
        end

        def jersey
          player.dig('jersey')
        end

        def full_name
          player.dig('full_name')
        end

        def team
          @attributes.dig('team') || {}
        end

        def team_id
          team.dig('id')
        end

        def team_market
          team.dig('market')
        end

        def team_name
          team.dig('name')
        end

        def stat
          {
            player_id: player_id,
            period_number: period_number,
            period_type: period_type,
            goal: goal?,
            penalty: penalty?,
            saved: saved?,
            shootout: shootout?,
            strength: strength,
            type: type,
            zone: zone,
          }.compact
        end

        def goal?
          @attributes.dig('goal') == true
        end

        def penalty?
          type == 'penalty'
        end

        def saved?
          @attributes.dig('saved') == true
        end

        def shootout?
          @attributes.dig('shootout') == true
        end

        def strength
          @attributes.dig('strength')
        end

        def type
          @attributes.dig('type')
        end

        def win?
          @attributes.dig('win') == true
        end

        def zone
          @attributes.dig('zone')
        end
      end
    end
  end
end
