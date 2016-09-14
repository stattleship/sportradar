module Sportradar
  module Nfl
    module Models
      class PlayPlayerStat
        def initialize(play:, attributes:)
          @play = play
          @attributes = attributes
        end

        def to_s
          [
            team,
            name,
            position,
            stats,
          ].join(' ')
        end

        def play_id
          @play.id
        end

        def player_id
          @attributes.dig('id')
        end

        def jersey
          @attributes.dig('jersey')
        end

        def name
          @attributes.dig('name')
        end

        def position
          @attributes.dig('position')
        end

        def team
          @attributes.dig('team')
        end

        def stats
          {
            'defense_assist' => defense_assist,
            'defense_category' => defense_category,
            'defense_forced_fumble' => defense_forced_fumble,
            'defense_interception' => defense_interception,
            'defense_sack' => defense_sack,
            'defense_sack_yards' => defense_sack_yards,
            'defense_safety' => defense_safety,
            'defense_tackle' => defense_tackle,
            'defense_tackle_lost' => defense_tackle_lost,
            'extra_point_attempt' => extra_point_attempt,
            'extra_point_blocked' => extra_point_blocked,
            'extra_point_made' => extra_point_made,
            'field_goal_attempt' => field_goal_attempt,
            'field_goal_attempt_yards' => field_goal_attempt_yards,
            'field_goal_blocked' => field_goal_blocked,
            'field_goal_made' => field_goal_made,
            'field_goal_return' => field_goal_return,
            'field_goal_yards' => field_goal_yards,
            'fumble_category' => fumble_category,
            'fumble_fumble' => fumble_fumble,
            'fumble_lost' => fumble_lost,
            'fumble_out_of_bounds' => fumble_out_of_bounds,
            'fumble_return_category' => fumble_return_category,
            'fumble_return_opp_rec' => fumble_return_opp_recovered,
            'fumble_return_own_recovered' => fumble_return_own_recovered,
            'fumble_return_returned' => fumble_return_returned,
            'fumble_return_touchdown' => fumble_return_touchdown,
            'fumble_return_yards' => fumble_return_yards,
            'kickoffs_endzone' => kickoffs_endzone,
            'kickoffs_inside_20' => kickoffs_inside_20,
            'kickoffs_kicks' => kickoffs_kicks,
            'kickoffs_net_yards' => kickoffs_net_yards,
            'kickoffs_returned' => kickoffs_returned,
            'kickoffs_touchback' => kickoffs_touchback,
            'kickoffs_yards' => kickoffs_yards,
            'passing_attempt' => passing_attempt,
            'passing_completion' => passing_completion,
            'passing_firt_down' => passing_firt_down,
            'passing_interception' => passing_interception,
            'passing_red_zone_attempt' => passing_red_zone_attempt,
            'passing_sacked' => passing_sacked,
            'passing_sacked_for_yards' => passing_sacked_for_yards,
            'passing_safety' => passing_safety,
            'passing_touchdown' => passing_touchdown,
            'passing_yards' => passing_yards,
            'penalty_abbreviation' => penalty_abbreviation,
            'penalty_first_down' => penalty_first_down,
            'penalty_yards' => penalty_yards,
            'punt_return_fair_catch' => punt_return_fair_catch,
            'punt_return_returned' => punt_return_returns,
            'punt_return_touchdown' => punt_return_touchdown,
            'punt_return_yards' => punt_return_yards,
            'punting_blocked' => punting_blocked,
            'punting_inside_20' => punting_inside_20,
            'punting_net_yards' => punting_net_yards,
            'punting_punts' => punting_punts,
            'punting_returned' => punting_returned,
            'punting_safety' => punting_safety,
            'punting_touchback' => punting_touchback,
            'punting_yardds' => punting_yardds,
            'receiving_first_down' => receiving_first_down,
            'receiving_fumble' => receiving_fumble,
            'receiving_reception' => receiving_reception,
            'receiving_red_zone_target' => receiving_red_zone_target,
            'receiving_target' => receiving_target,
            'receiving_touchdown' => receiving_touchdown,
            'receiving_yards' => receiving_yards,
            'receiving_yards_after_catch' => receiving_yards_after_catch,
            'rushing_first_down' => rushing_first_down,
            'rushing_fumble' => rushing_fumble,
            'rushing_red_zone_attempt' => rushing_red_zone_attempt,
            'rushing_rush' => rushing_rush,
            'rushing_safety' => rushing_safety,
            'rushing_touchdown' => rushing_touchdown,
            'rushing_yards' => rushing_yards,
            'two_point_conversion_attempt' => two_point_conversion_attempt,
            'two_point_conversion_failed' => two_point_conversion_failed,
            'two_point_conversion_made' => two_point_conversion_made,
            'two_point_conversion_pass' => two_point_conversion_pass,
            'two_point_conversion_rececption' => two_point_conversion_rececption,
            'two_point_conversion_rush' => two_point_conversion_rush,
          }.compact
        end

        def defense_assist
          @attributes.dig('defense', 'ast')
        end

        def defense_category
          @attributes.dig('defense', 'category')
        end

        def defense_forced_fumble
          @attributes.dig('defense', 'fum')
        end

        def defense_interception
          @attributes.dig('defense', 'int')
        end

        def defense_sack
          @attributes.dig('defense', 'sack')
        end

        def defense_sack_yards
          @attributes.dig('defense', 'yds')
        end

        def defense_safety
          @attributes.dig('defense', 'sfty')
        end

        def defense_tackle
          @attributes.dig('defense', 'tackle')
        end

        def defense_tackle_lost
          @attributes.dig('defense', 'tlost')
        end

        def rushing_rush
          @attributes.dig('rushing', 'att')
        end

        def rushing_first_down
          @attributes.dig('rushing', 'fd')
        end

        def rushing_fumble
          @attributes.dig('rushing', 'fum')
        end

        def rushing_red_zone_attempt
          @attributes.dig('rushing', 'rz_att')
        end

        def rushing_safety
          @attributes.dig('rushing', 'sfty')
        end

        def rushing_touchdown
          @attributes.dig('rushing', 'td')
        end

        def rushing_yards
          @attributes.dig('rushing', 'yds')
        end

        def field_goal_attempt
          @attributes.dig('field_goal', 'att')
        end

        def field_goal_attempt_yards
          @attributes.dig('field_goal', 'att_yds')
        end

        def field_goal_blocked
          @attributes.dig('field_goal', 'blk')
        end

        def field_goal_made
          @attributes.dig('field_goal', 'made')
        end

        def field_goal_return
          @attributes.dig('field_goal', 'ret')
        end

        def field_goal_yards
          @attributes.dig('field_goal', 'yds')
        end

        def passing_attempt
          @attributes.dig('passing', 'att')
        end

        def passing_completion
          @attributes.dig('passing', 'cmp')
        end

        def passing_firt_down
          @attributes.dig('passing', 'fd')
        end

        def passing_interception
          @attributes.dig('passing', 'int')
        end

        def passing_red_zone_attempt
          @attributes.dig('passing', 'rz_att')
        end

        def passing_safety
          @attributes.dig('passing', 'sfty')
        end

        def passing_sacked
          @attributes.dig('passing', 'sk')
        end

        def passing_sacked_for_yards
          @attributes.dig('passing', 'sk_yds')
        end

        def passing_touchdown
          @attributes.dig('passing', 'td')
        end

        def passing_yards
          @attributes.dig('passing', 'yds')
        end

        def penalty_abbreviation
          @attributes.dig('penalty', 'abbr')
        end

        def penalty_first_down
          @attributes.dig('penalty', 'fd')
        end

        def penalty_yards
          @attributes.dig('penalty', 'yds')
        end

        def receiving_first_down
          @attributes.dig('receiving', 'fd')
        end

        def receiving_fumble
          @attributes.dig('receiving', 'fum')
        end

        def receiving_reception
          @attributes.dig('receiving', 'rec')
        end

        def receiving_red_zone_target
          @attributes.dig('receiving', 'rz_tar')
        end

        def receiving_target
          @attributes.dig('receiving', 'tar')
        end

        def receiving_touchdown
          @attributes.dig('receiving', 'td')
        end

        def receiving_yards_after_catch
          @attributes.dig('receiving', 'yac')
        end

        def receiving_yards
          @attributes.dig('receiving', 'yds')
        end

        def extra_point_attempt
          @attributes.dig('extra_point', 'att')
        end

        def extra_point_blocked
          @attributes.dig('extra_point', 'blk')
        end

        def extra_point_made
          @attributes.dig('extra_point', 'made')
        end

        def kickoffs_endzone
          @attributes.dig('kickoffs', 'endzone')
        end

        def kickoffs_inside_20
          @attributes.dig('kickoffs', 'in20')
        end

        def kickoffs_kicks
          @attributes.dig('kickoffs', 'kicks')
        end

        def kickoffs_net_yards
          @attributes.dig('kickoffs', 'net_yds')
        end

        def kickoffs_returned
          @attributes.dig('kickoffs', 'ret')
        end

        def kickoffs_touchback
          @attributes.dig('kickoffs', 'tb')
        end

        def kickoffs_yards
          @attributes.dig('kickoffs', 'yds')
        end

        def punting_blocked
          @attributes.dig('punting', 'blk')
        end

        def punting_inside_20
          @attributes.dig('punting', 'in20')
        end

        def punting_net_yards
          @attributes.dig('punting', 'net_yds')
        end

        def punting_punts
          @attributes.dig('punting', 'punts')
        end

        def punting_returned
          @attributes.dig('punting', 'ret')
        end

        def punting_safety
          @attributes.dig('punting', 'sfty')
        end

        def punting_touchback
          @attributes.dig('punting', 'tb')
        end

        def punting_yardds
          @attributes.dig('punting', 'yds')
        end

        def punt_return_fair_catch
          @attributes.dig('punt_return', 'fc')
        end

        def punt_return_returns
          @attributes.dig('punt_return', 'returns')
        end

        def punt_return_touchdown
          @attributes.dig('punt_return', 'td')
        end

        def punt_return_yards
          @attributes.dig('punt_return', 'yds')
        end

        def fumble_category
          @attributes.dig('fumble', 'category')
        end

        def fumble_fumble
          @attributes.dig('fumble', 'fum')
        end

        def fumble_lost
          @attributes.dig('fumble', 'lost')
        end

        def fumble_out_of_bounds
          @attributes.dig('fumble', 'oob')
        end

        def fumble_return_category
          @attributes.dig('fumble_return', 'category')
        end

        def fumble_return_opp_recovered
          @attributes.dig('fumble_return', 'opp_rec')
        end

        def fumble_return_own_recovered
          @attributes.dig('fumble_return', 'own_rec')
        end

        def fumble_return_returned
          @attributes.dig('fumble_return', 'returns')
        end

        def fumble_return_touchdown
          @attributes.dig('fumble_return', 'td')
        end

        def fumble_return_yards
          @attributes.dig('fumble_return', 'yds')
        end

        def two_point_conversion_attempt
          @attributes.dig('two_point_conversion', 'att')
        end

        def two_point_conversion_failed
          @attributes.dig('two_point_conversion', 'failed')
        end

        def two_point_conversion_made
          @attributes.dig('two_point_conversion', 'made')
        end

        def two_point_conversion_pass
          @attributes.dig('two_point_conversion', 'pass')
        end

        def two_point_conversion_rececption
          @attributes.dig('two_point_conversion', 'rec')
        end

        def two_point_conversion_rush
          @attributes.dig('two_point_conversion', 'rush')
        end
      end
    end
  end
end
