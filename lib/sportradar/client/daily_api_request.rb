module Sportradar
  class DailyApiRequest < Sportradar::ApiRequest
    def client
      Sportradar::Client.new(league: league,
                             path: path,
                             endpoint: endpoint)
    end

    def fetch
      client.fetch
    end

    def league
      self.class.name.split('::')[1].downcase
    end

    def endpoint
      self.class.name.demodulize.underscore
    end

    def path
      raise 'Api Request subclass must implement'
    end

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
