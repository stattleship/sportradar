module Sportradar
  module Nba
    module Models
      class Event
        def initialize(quarter:, attributes:)
          @quarter = quarter
          @attributes = attributes
          build_statistics
        end

        def to_s
          [].tap do |sentence_parts|
            sentence_parts << quarter_number
            sentence_parts << clock
            sentence_parts << team_name if has_team?
            sentence_parts << team_basket if has_team?
            sentence_parts << event_type
            sentence_parts << description
            sentence_parts << "[#{coordinate_x}, #{coordinate_y}]" if coordinates?
          end.join(' - ')
        end

        def id
          @attributes['id']
        end

        def game_id
          quarter.game_id
        end

        def possession?
          possession.present?
        end

        def possession
          @attributes['possession'] || {}
        end

        def possession_team_id
          possession_team.dig('id')
        end

        def possession_team_name
          possession.dig('name')
        end

        def team
          @attributes['attribution'] || {}
        end

        def team_id
          team.dig('id')
        end

        def team_name
          team.dig('name')
        end

        def team_basket
          team.dig('team_basket')
        end

        def has_team?
          !team_id.nil?
        end

        def quarter
          @quarter
        end

        def quarter_id
          @quarter.id
        end

        def quarter_number
          @quarter.number
        end

        def time_code
          min, sec = clock.split(':').map(&:to_i)
          "PT#{min}M#{sec}S"
        end

        def clock
          @attributes['clock'] || '0'
        end

        def clock_secs
          begin
            if clock && clock.include?(':')
              mins, secs = clock.split(':').map(&:to_i)
              Time.parse("00:#{mins}:#{secs}").
                 seconds_since_midnight.to_i
            end
          rescue => e
            return 0
          end
        end
        alias_method :quarter_seconds, :clock_secs

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
          @play_player_stats ||= []
        end

        def foul?
          event_type.include?('foul') || event_type.include?('flagrant')
        end

        def foul
          self if foul?
        end

        def scoring_play?
          event_type.include?('made')
        end

        def scoring_play
          self if scoring_play?
        end

        def stoppage?
          %w(endperiod delay officialtimeout review teamtimeout tvtimeout).include?(event_type)
        end

        def stoppage
          self if stoppage?
        end

        private

        def build_on_court
        end

        def build_statistics
          statistics.each do |statistic|
            play_player_stats << Models::PlayPlayerStat.new(event: self, attributes: statistic)
            # scoring_players << Models::ScoringPlayer.new(event: self, attributes: statistic) if scoring_play?
          end
        end
      end
    end
  end
end
