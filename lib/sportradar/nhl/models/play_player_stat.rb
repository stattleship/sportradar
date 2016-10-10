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
            period_number,
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

        def period_number
          period.number
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
            goal: goal?,
            saved: saved?,
            strength: strength,
            type: type,
            zone: zone,
          }.compact
        end

        def goal?
          @attributes.dig('goal') && (@attributes.dig('goal') == true)
        end

        def penalty?
          @attributes.dig('penalty') && (@attributes.dig('penalty') == true)
        end

        def saved?
          @attributes.dig('saved') && (@attributes.dig('saved') == true)
        end

        def shootout?
          @attributes.dig('shootout') && (@attributes.dig('shootout') == true)
        end

        def strength
          @attributes.dig('strength')
        end

        def type
          @attributes.dig('type')
        end

        def win?
          @attributes.dig('win') && (@attributes.dig('win') == true)
        end

        def zone
          @attributes.dig('zone')
        end
      end
    end
  end
end
