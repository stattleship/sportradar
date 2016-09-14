module Sportradar
  module Nfl
    module Models
      class Play
        def initialize(drive:, attributes:)
          @drive = drive
          @attributes = attributes
        end

        def to_s
          summary
        end

        def game_id
          @drive.game_id
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

        def details
          @attributes['details']
        end

        def down
          @attributes['down']
        end

        def participants
          @attributes['participants']
        end

        def play_type
          @attributes['play_type']
        end

        def sequence
          @attributes['sequence']
        end

        def side
          @attributes['side']
        end

        def summary
          @attributes['summary']
        end

        def type
          @attributes['type']
        end

        def updated_at
          @attributes['updated']
        end

        def yard_line
          @attributes['yard_line']
        end

        def yards_to_first_down
          @attributes['yfd']
        end

        def direction
          @attributes['direction']
        end

        def distance
          @attributes['distance']
        end

        def formation
          @attributes['formation']
        end

        def official?
          @attributes['official']
        end

        def sequence
          @attributes['sequence']
        end
      end
    end
  end
end
