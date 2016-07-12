module Sportradar
  module Mlb
    class Glossary < Sportradar::ApiRequest
      def initialize
      end

      def path
        "league/glossary.json"
      end
    end
  end
end
