module Sportradar
  class ApiRequest
    def client
      Sportradar::Client.new(league: league,
                             path: path,
                             endpoint: endpoint)
    end

    def self.fetch
      new.fetch
    end

    def fetch
      client.fetch
    end

    def self.save
      new.save
    end

    def save
      client.save
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
  end
end
