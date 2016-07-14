module Sportradar
  module Mlb
    module Models
      class AtBat
        def initialize(attributes: {})
          @attributes = attributes
        end

        def to_s
          "#{half} of #{inning}: #{description}"
        end

        def description
          attributes['description']
        end

        def events
          attributes['events'] || []
        end

        def hitter_id
          attributes['hitter_id']
        end

        def id
          attributes['id']
        end

        def time_code
          attributes['time_code']
        end

        def half
          time_code['half']
        end

        def inning
          time_code['inning']
        end

        def number
          time_code['number']
        end

        def sequence
          time_code['sequence']
        end

        def self.from_innings(innings:)
          [].tap do |at_bats|
            innings.each do |inning|
              (inning['halfs'] || []).each do |halfs|
                (halfs['events'] || []).each do |event|
                  if event.has_key?('at_bat')
                    at_bats << new(attributes: (event['at_bat'] || {}).
                                 merge('time_code' => { 'number' => inning['number'],
                                                        'inning' => inning['sequence'],
                                                        'half' => halfs['half'],
                                                        'sequence' => inning['sequence'] }))
                  end
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
