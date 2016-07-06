module Sportradar
  class DailyApiRequest < Sportradar::ApiRequest
    private

    attr_reader :date

    def year
      date.strftime('%Y')
    end

    def month
      date.strftime('%m')
    end

    def day
      date.strftime('%d')
    end
  end
end
