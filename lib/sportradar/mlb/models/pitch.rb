module Sportradar
  module Mlb
    module Models
      class Pitch
        def initialize(attributes:)
          @attributes = attributes
        end

        def to_s
          pitch_outcome
        end

        def at_bat_balls
          attributes['at_bat_balls']
        end

        def at_bat_outs
          attributes['at_bat_outs']
        end

        def at_bat_pitch_count
          attributes['at_bat_pitch_count']
        end

        def at_bat_strikes
          attributes['at_bat_strikes']
        end

        def pitch_count
          attributes['pitch_count']
        end

        def pitch_speed
          attributes['pitch_speed']
        end

        def pitch_type
          attributes['pitch_type']
        end

        def pitch_zone
          attributes['pitch_zone']
        end

        def at_bat_id
          attributes['at_bat_id']
        end

        def event_id
          attributes['event_id']
        end

        def pitcher_id
          attributes['pitcher_id']
        end

        def pitch_outcome_type
          attributes['pitch_outcome_type']
        end

        def hitter_id
          attributes['hitter_id']
        end

        def hit_type
          attributes['hit_type']
        end

        def hit_location
          attributes['hit_location']
        end

        def pitched_at
          attributes['pitched_at']
        end

        def at_bat?
          attributes['is_ab']
        end

        def at_bat_over?
          attributes['is_ab_over']
        end

        def bunt?
          attributes['is_bunt']
        end

        def bunt_shown?
          attributes['is_bunt_shown']
        end

        def double_play?
          attributes['is_double_play']
        end

        def hit?
          attributes['is_hit']
        end

        def on_base?
          attributes['is_on_base']
        end

        def passed_ball?
          attributes['is_passed_ball']
        end

        def triple_play?
          attributes['is_triple_play']
        end

        def wild_pitch?
          attributes['is_wild_pitch']
        end

        def number
          attributes['number']
        end

        def inning
          attributes['inning']
        end

        def half
          attributes['half']
        end

        def sequence
          attributes['sequence']
        end

        def pitch_outcome
          attributes['pitch_outcome']
        end

        def self.from_at_bats(at_bats: [])
          [].tap do |pitches|
            at_bats.each do |at_bat|
              at_bat.events.each do |event|
                if event['type'] == 'pitch' && event['status'] == 'official'
                  pitches << new(attributes: event['pitcher'].
                                               merge('at_bat_id' => at_bat.id,
                                                     'event_id' => event['id'],
                                                     'pitched_at' => event['created_at'],
                                                     'pitcher_id' => event['pitcher']['id'],
                                                     'pitch_outcome_type' => event['outcome_id'],
                                                     'hitter_id' => at_bat.hitter_id,
                                                     'hit_type' => event['hit_type'],
                                                     'hit_location' => event['hit_location']).
                                               merge((event['count'] || {}).transform_keys { |key| key.dup.to_s.prepend('at_bat_') }).
                                               merge(event['flags']).
                                               merge(at_bat.time_code).
                                               merge('pitch_outcome' => PitchOutcome.new(outcome: event['outcome_id']).
                                                                          to_s).
                                               except('id'))
                end
              end
            end
          end
        end

        private

        attr_reader :attributes
      end
    end
  end
end
