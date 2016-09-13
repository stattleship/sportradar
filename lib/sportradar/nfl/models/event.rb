module Sportradar
  module Nfl
    module Models
      class Event
        def initialize(drive:, attributes:)
          @drive = drive
          @attributes = attributes
        end

        def to_s
          event_type
        end

        def team
          @drive.team
        end

        def drive_id
          @drive.id
        end

        def quarter
          @drive.quarter
        end

        def quarter_number
          quarter.number
        end

        def clock
          @attributes['clock']
        end

        def id
          @attributes['id']
        end

        def sequence
          @attributes['sequence']
        end

        def event_type
          @attributes['event_type']
        end

        def type
          @attributes['type']
        end

        def updated_at
          @attributes['updated']
        end
      end
    end
  end
end
