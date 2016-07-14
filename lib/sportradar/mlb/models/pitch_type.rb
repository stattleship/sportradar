module Sportradar
  module Mlb
    module Models
      class PitchType
        def initialize(pitch_type:)
          @pitch_type = pitch_type
        end

        def to_s
          pitch_types[pitch_type] || ''
        end

        private

        attr_reader :pitch_type

        def pitch_types
          {
        {
            "id": "FA",
            "legacy_group": "Fastball",
            "legacy_id": "1.1",
            "type": "Fastball"
        },
        {
            "id": "SI",
            "legacy_group": "Fastball",
            "legacy_id": "1.2",
            "type": "Sinker"
        },
        {
            "id": "CT",
            "legacy_group": "Fastball",
            "legacy_id": "1.3",
            "type": "Cutter"
        },
        {
            "id": "CU",
            "legacy_group": "Curveball",
            "legacy_id": "2.1",
            "type": "Curveball"
        },
        {
            "id": "SL",
            "legacy_group": "Slider",
            "legacy_id": "3.1",
            "type": "Slider"
        },
        {
            "id": "CH",
            "legacy_group": "Changeup",
            "legacy_id": "4.1",
            "type": "Changeup"
        },
        {
            "id": "KN",
            "legacy_group": "Other",
            "legacy_id": "5.1",
            "type": "Knuckleball"
        },
        {
            "id": "SP",
            "legacy_group": "Other",
            "legacy_id": "5.2",
            "type": "Splitter"
        },
        {
            "id": "SC",
            "legacy_group": "Other",
            "legacy_id": "5.3",
            "type": "Screwball"
        },
        {
            "id": "FO",
            "legacy_group": "Other",
            "legacy_id": "5.4",
            "type": "Forkball"
        },
        {
            "legacy_group": "Other",
            "legacy_id": "5.5",
            "type": "Other"
        },
        {
            "id": "IB",
            "legacy_group": "Other",
            "legacy_id": "5.6",
            "type": "Intentional Ball"
        },
        {
            "id": "PI",
            "legacy_group": "Other",
            "legacy_id": "5.7",
            "type": "Pitchout"
        }          }
        end
      end
    end
  end
end
