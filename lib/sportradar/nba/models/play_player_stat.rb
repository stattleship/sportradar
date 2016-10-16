module Sportradar
  module Nba
    module Models
      class PlayPlayerStat
        def initialize(event:, attributes:)
          @event = event
          @attributes = attributes
        end

        def to_s
          [
            quarter_number,
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

        def quarter
          @event.quarter
        end

        def quarter_number
          quarter.number
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
            team_id: team_id,
            made: made?,
            free_throw_type: free_throw_type,
            free_throw: free_throw?,
            regular_free_throw: regular_free_throw?,
            technical_free_throw: technical_free_throw?,
            points: points,
            rebound_type: rebound_type,
            defensive_rebound: defensive_rebound?,
            offensive_rebound: offensive_rebound?,
            shot_type: shot_type,
            shot_type_desc: shot_type_desc,
            three_point_shot: three_point_shot?,
            type: type,
          }.compact
        end

        def made?
          @attributes.dig('made') == true
        end

        def free_throw_type
          @attributes.dig('free_throw_type')
        end

        def free_throw?
          type == 'free_throw'
        end

        def regular_free_throw?
          free_throw_type == 'regular'
        end

        def technical_free_throw?
          free_throw_type == 'technical'
        end

        def points
          @attributes.dig('points')
        end

        def defensive_rebound?
          rebound_type == 'defensive'
        end

        def offensive_rebound?
          rebound_type == 'offensive'
        end

        def rebound_type
          @attributes.dig('rebound_type')
        end

        def shot_type
          @attributes.dig('shot_type')
        end

        def shot_type_desc
          @attributes.dig('shot_type_desc')
        end

        def three_point_shot?
          @attributes.dig('three_point_shot') == true
        end

        def type
          @attributes.dig('type')
        end

        def jump_shot?
          shot_type == 'jump shot'
        end

        def layup?
          shot_type == 'layup'
        end

        def dunk?
          shot_type == 'dunk'
        end

        def hook?
          shot_type == 'hook'
        end

        def tip?
          shot_type == 'tip'
        end
      end
    end
  end
end
