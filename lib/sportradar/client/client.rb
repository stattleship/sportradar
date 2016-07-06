module Sportradar
  class Client
    def initialize(league:,
                   endpoint:,
                   path:,
                   query: nil)
      @league = league
      @endpoint = endpoint
      @base_uri = Sportradar.configuration.base_uri.freeze
      @path = path
      @query = query
    end

    def fetch
      Oj.load(Sportradar.configuration.
                http.
                request(request).
                body)
    rescue StandardError => e
      puts "HTTP Request failed (#{e.message})"
      raise e
    end

    def save
      Sportradar.configuration.http.request(request) do |response|
        File.open filename, 'w' do |io|
          response.read_body do |chunk|
            io.write chunk
          end
        end
      end
    rescue StandardError => e
      puts "HTTP Request failed (#{e.message})"
      raise e
    end

    def headers
      {}
    end

    def filename
      File.join "/Users/dthyresson/Dropbox/stattleship_inc/sports_data/#{sport}/sportradar/#{league}/2016/#{endpoint}",
                "#{sport}_#{league}_#{path.gsub('/', '_')}"
    end

    def url
      @url ||= begin
        if query
          template = Addressable::Template.new("#{base_uri}/#{league}-#{api_version}/#{path}{?query*}&api_key=c2sxbkw5t7qbvy5v2j3snxu3")
          template.partial_expand(query).pattern
        else
          "#{base_uri}/#{league}-#{api_version}/#{path}?api_key=c2sxbkw5t7qbvy5v2j3snxu3"
        end
      end
    end

    def request
      Net::HTTP::Get.new(url, headers)
    end

    def api_version
      case league
      when 'mlb'
        't5'
      else
        't5'
      end
    end

    private

    attr_reader :base_uri, :path, :query, :league, :sport, :endpoint

    def sport
      case league
      when 'mlb'
        'baseball'
      else
        'baseball'
      end
    end
  end
end
