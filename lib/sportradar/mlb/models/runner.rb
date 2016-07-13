module Sportradar
  module Mlb
    module Models
      class Runner
        def initialize(runner: {})
          @runner = runner
        end

        def id
          runner['id']
        end

        def first_name
          runner['first_name']
        end

        def jersey_number
          runner['jersey_number']
        end

        def last_name
          runner['last_name']
        end

        def preferred_name
          runner['preferred_name']
        end

        def starting_base
          runner['starting_base']
        end

        def starting_base_name
          if starting_base
            if starting_base == 0
              'Home'
            else
              "#{ActiveSupport::Inflector.ordinalize(starting_base)} base"
            end
          end
        end

        def starting_base_label
          if starting_base
            if starting_base == 0
              'HP'
            else
              "#{starting_base}B"
            end
          end
        end

        private

        attr_reader :runner
      end
    end
  end
end
