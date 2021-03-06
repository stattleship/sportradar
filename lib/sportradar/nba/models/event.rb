module Sportradar
  module Nba
    module Models
      class Event
        COURT_LENGTH = 1128
        BASKET_CENTER_X = 57
        BASKET_CENTER_Y = 300

        def initialize(quarter:, attributes:)
          @quarter = quarter
          @attributes = attributes
          build_statistics
        end

        def to_s
          [].tap do |sentence_parts|
            sentence_parts << quarter_abbreviation
            sentence_parts << clock
            sentence_parts << team_name if has_team?
            sentence_parts << team_basket if has_team?
            sentence_parts << event_type
            sentence_parts << description
            sentence_parts << free_throw_attempt
            sentence_parts << free_throw_attempt_of
            sentence_parts << turnover_type
            sentence_parts << "[#{coordinate_x}, #{coordinate_y}]" if coordinates?
            sentence_parts << distance_from_scoring_basket_inches
            sentence_parts << distance_to_scoring_basket_inches
          end.compact.
            join(' - ')
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
          possession.dig('id')
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

        def quarter_abbreviation
          @quarter.abbreviation
        end

        def quarter_number
          @quarter.number
        end

        def quarter_sequence
          @quarter.sequence
        end

        def quarter_type
          @quarter.type
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

        def attempt_in_words
          @attributes['attempt']
        end

        def attempt_matches
          /(\d) of (\d)/.match(attempt_in_words)
        end

        def free_throw_attempt
          if matches = attempt_matches
            matches[0].to_i
          end
        end

        def free_throw_attempt_of
          if matches = attempt_matches
            matches[1].to_i
          end
        end

        def description
          @attributes['description'] || 0
        end

        def distance_from_scoring_basket_inches
          if coordinates?
            if scoring_basket = team_basket
              if scoring_basket == 'left'
                Math.hypot(COURT_LENGTH - coordinate_x - BASKET_CENTER_X,
                           (coordinate_y  - BASKET_CENTER_Y).abs).
                  round(3)
              elsif scoring_basket == 'right'
                Math.hypot(coordinate_x - BASKET_CENTER_X,
                           (coordinate_y  - BASKET_CENTER_Y).abs).
                  round(3)
              else
                0
              end
            end
          end
        end

        def distance_to_scoring_basket_inches
          if coordinates?
            if scoring_basket = team_basket
              if scoring_basket == 'left'
                Math.hypot(coordinate_x - BASKET_CENTER_X,
                           (coordinate_y  - BASKET_CENTER_Y).abs).
                  round(3)
              elsif scoring_basket == 'right'
                Math.hypot(COURT_LENGTH - coordinate_x - BASKET_CENTER_X,
                           (coordinate_y  - BASKET_CENTER_Y).abs).
                  round(3)
              else
                0
              end
            end
          end
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

        def turnover_type
          @attributes['turnover_type']
        end

        def updated_at
          @attributes['updated']
        end

        def statistics
          @attributes['statistics'] || []
        end

        def field_goal?
          two_pointer? || three_pointer?
        end

        def field_goal
          self if field_goal?
        end

        def three_pointer?
          event_type.include?('threepoint')
        end

        def three_pointer
          self if three_pointer?
        end

        def two_pointer?
          event_type.include?('twopoint')
        end

        def two_pointer
          self if two_pointer?
        end

        def foul?
          event_type.include?('foul') || event_type.include?('flagrant')
        end

        def foul
          self if foul?
        end

        def free_throw?
          event_type.include?('free_throw')
        end

        def free_throw
          self if free_throw?
        end

        def made?
          event_type.include?('made')
        end

        def miss?
          event_type.include?('miss')
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

        def turnover?
          event_type.include?('turnover')
        end

        def turnover
          self if turnover?
        end

        def play_player_stats
          @play_player_stats ||= []
        end

        def scoring_players
          @scoring_players ||= []
        end

        def on_court_players
          @on_court_players ||= on_court_away_players + on_court_home_players
        end

        def on_court_away_team_id
          @on_court_away_team_id ||= @attributes.dig('on_court', 'away', 'id')
        end

        def on_court_away_team_name
          @on_court_away_team_name ||= @attributes.dig('on_court', 'away', 'name')
        end

        def on_court_away_players
          (@attributes.dig('on_court', 'away', 'players') || {}).map do |player|
            Models::OnCourtPlayer.new(
              player.reverse_merge({
                                     'event_id' => id,
                                     'player_id' => player['id'],
                                     'team_id' => on_court_away_team_id,
                                     'team_name' =>  on_court_away_team_name,
                                    })
              )
          end
        end

        def on_court_home_team_id
          @on_court_home_team_id ||= @attributes.dig('on_court', 'home', 'id')
        end

        def on_court_home_team_name
          @on_court_home_team_name ||= @attributes.dig('on_court', 'home', 'name')
        end

        def on_court_home_players
          (@attributes.dig('on_court', 'home', 'players') || {}).map do |player|
            Models::OnCourtPlayer.new(
              player.reverse_merge({
                                     'event_id' => id,
                                     'player_id' => player['id'],
                                     'team_id' => on_court_home_team_id,
                                     'team_name' =>  on_court_home_team_name,
                                    })
              )
          end
        end

        private

        def build_statistics
          statistics.each do |statistic|
            play_player_stats << Models::PlayPlayerStat.new(event: self, attributes: statistic)
            scoring_players << Models::ScoringPlayer.new(event: self, attributes: statistic) if scoring_play?
          end
        end
      end
    end
  end
end
