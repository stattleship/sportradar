module Sportradar
  module Nhl
    module Models
      class Event

        EVENT_TYPES = %w(emptynetgoal endperiod endshootoutperiod evenstrength faceoff giveaway goal goaliechange hit penalty penaltygoal penaltyshotmissed penaltyshotsaved powerplay shootoutgoal shootoutshotmissed shootoutshotsaved shotmissed shotsaved startshootoutperiod stoppage takeaway teamtimeout tvtimeout)
        PLAY_TYPES = %w(emptynetgoal faceoff giveaway goal hit penalty penaltygoal penaltyshotmissed penaltyshotsaved powerplay shootoutgoal shootoutshotmissed shootoutshotsaved shotmissed shotsaved takeaway)
        STOPPAGE_TYPES = %w(stoppage teamtimeout tvtimeout endperiod)
        SCORING_PLAY_TYPES = %w(goal penaltygoal shootoutgoal)
        PENALTY_TYPES = %w(penalty)

        def initialize(period:, attributes:)
          @period = period
          @attributes = attributes
        end

        def to_s
          if coordinates?
            "#{period_number} - #{clock} - #{event_type}: #{description} [#{coordinate_x}, #{coordinate_y}]"
          else
            "#{period_number} - #{clock} - #{event_type}: #{description}"
          end
        end

        def team
          @attributes['attribution'] || {}
        end

        def team_id
          team.dig('id')
        end

        def has_team?
          !team_id.nil?
        end

        def period
          @period
        end

        def period_id
          @period.id
        end

        def period_number
          @period.number
        end

        def clock
          @attributes['clock'] || '0'
        end

        def id
          @attributes['id']
        end

        def description
          @attributes['description'] || 0
        end

        def event_type
          @attributes['event_type']
        end

        def coordinates
          @attributes['location'] || {}
        end

        def coordinates?
          @attributes['location'].present?
        end

        def coordinate_x
          coordinates['coord_x']
        end

        def coordinate_y
          coordinates['coord_y']
        end

        def official
          @attributes['official']
        end

        def strength
          @attributes['strength']
        end

        def wall_clock
          @attributes['wall_clock']
        end

        def zone
          @attributes['zone']
        end

        def updated_at
          @attributes['updated']
        end

        def statistics
          @attributes['statistics'] || []
        end

        def play_player_stats
          @play_player_stats ||= build_statistics || []
        end

        def penalty?
          PENALTY_TYPES.include?(event_type)
        end

        def play?
          PLAY_TYPES.include?(event_type)
        end

        def scoring_play?
          SCORING_PLAY_TYPES.include?(event_type)
        end

        def stoppage?
          STOPPAGE_TYPES.include?(event_type)
        end

        private

        def build_statistics
          statistics.each_with_object([]) do |action, statistic|
            statistic << Models::PlayPlayerStat.new(event: self, attributes: action)
          end
        end
      end
    end
  end
end
