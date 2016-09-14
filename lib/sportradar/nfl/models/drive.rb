module Sportradar
  module Nfl
    module Models

      # NOTE: This data structure isn't techincially a single drive as due to the way
      # Sportradar structures the play by play data and how it will be parsed
      # a drive could be separated into two sets of info and plays by a TV timeout or
      # the end of the quarter. The data/drive will continue using the same drive id
      # in subsequent action data.
      #
      # Therefore, it would be incorrect to count the number of plays in the drive
      # to get the play count.
      #
      # In addition, the drive data can contain actions/plays for other teams, such as
      # when one team kicks off, then a tvtimeout, then the offensive team has their first play.
      #
      # To get the offensive plays, you need to compare the drive's team with the play's side.

      class Drive
        def initialize(quarter:, attributes:)
          @quarter = quarter
          @attributes = attributes
        end

        def to_s
          "#{quarter.to_s} #{clock}"
        end

        def game_id
          quarter.game_id
        end

        def quarter
          @quarter
        end

        def quarter_number
          @quarter.number
        end

        def clock
          @attributes['clock'] || '0'
        end

        def id
          @attributes['id']
        end

        def team
          @attributes['team']
        end

        def type
          @attributes['type']
        end

        def actions
          @actions ||= @attributes.dig('actions') || []
        end

        def plays
          @plays || build_plays || []
        end

        def events
          @events || build_events || []
        end

        private

        def build_plays
          actions.each_with_object([]) do |action, _plays|
            if action['type'] == 'play'
              _plays << Models::Play.new(drive: self, attributes: action)
            end
          end
        end

        def build_events
          actions.each_with_object([]) do |action, _events|
            if action['type'] != 'play'
              _events << Models::Event.new(drive: self, attributes: action)
            end
          end
        end
      end
    end
  end
end
