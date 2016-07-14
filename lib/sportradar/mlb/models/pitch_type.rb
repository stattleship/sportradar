module Sportradar
  module Mlb
    module Models
      class PitchType
        def initialize(pitch_type:)
          @pitch_type = pitch_type
        end

        def to_s
          name
        end

        def name
          pitch_info['type'] || ''
        end

        def pitch_info
          pitch_types[pitch_type] || {}
        end

        private

        attr_reader :pitch_type

        def pitch_types
          {
            'FA' => {
                      'legacy_group' => 'Fastball',
                      'legacy_id' => '1.1',
                      'type' => 'Fastball',
                    },
            'SI' => {
                      'legacy_group' => 'Fastball',
                      'legacy_id' => '1.2',
                      'type' => 'Sinker',
                    },
            'CT' => {
                      'legacy_group' => 'Fastball',
                      'legacy_id' => '1.3',
                      'type' => 'Cutter',
                    },
            'CU' => {
                      'legacy_group' => 'Curveball',
                      'legacy_id' => '2.1',
                      'type' => 'Curveball',
                    },
            'SL' => {
                      'legacy_group' => 'Slider',
                      'legacy_id' => '3.1',
                      'type' => 'Slider',
                    },
            'CH' => {
                      'legacy_group' => 'Changeup',
                      'legacy_id' => '4.1',
                      'type' => 'Changeup',
                    },
            'KN' => {
                      'legacy_group' => 'Other',
                      'legacy_id' => '5.1',
                      'type' => 'Knuckleball',
                    },
            'SP' => {
                      'legacy_group' => 'Other',
                      'legacy_id' => '5.2',
                      'type' => 'Splitter',
                    },
            'SC' => {
                      'legacy_group' => 'Other',
                      'legacy_id' => '5.3',
                      'type' => 'Screwball',
                    },
            'FO' => {
                      'legacy_group' => 'Other',
                      'legacy_id' => '5.4',
                      'type' => 'Forkball',
                    },
            'IB' => {
                      'legacy_group' => 'Other',
                      'legacy_id' => '5.6',
                      'type' => 'Intentional Ball',
                    },
            'PI' => {
                      'legacy_group' => 'Other',
                      'legacy_id' => '5.7',
                      'type' => 'Pitchout',
                    },
          }
        end
      end
    end
  end
end
