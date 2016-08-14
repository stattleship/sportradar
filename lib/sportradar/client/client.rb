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

    def response
      Sportradar.configuration.http.request(request) do |res|
        case res.code
        when '200'
          res
        when '401'
          raise 'Unauthorized'
        when '403'
          raise 'Forbidden'
        else
          raise "#{res.code} Error in HTTP request for #{path}"
        end
      end
    rescue StandardError => e
      puts "HTTP Request for #{path} failed (#{e.message})"
      raise e
    end

    def fetch
      Oj.load(response.body)
    rescue StandardError => e
      puts "Parsing Error (#{e.message})"
      raise e
    end

    def save
      if result = File.write(output_file, response.body)
        if result == 0
          puts "File #{filename} saved with no content."
        end
      end
    rescue StandardError => e
      puts "File #{filename} saving failed (#{e.message})"
      raise e
    end

    def headers
      {}
    end

    def output_file
      File.join filepath, filename
    end

    def filename
      "#{sport}_#{league}_#{path.gsub('/', '_')}"
    end

    def filepath
      "#{Sportradar.configuration.filepath.freeze}/#{sport}/#{league}/#{endpoint}".tap do |path|
        FileUtils.mkpath(path)
      end
    end

    def url
      @url ||= begin
        if query
          template = Addressable::Template.new("#{base_uri}/#{league}-#{access_level}#{api_version}/#{path}{?query*}&api_key=#{api_key}")
          template.partial_expand(query).pattern
        else
          "#{base_uri}/#{league}-#{access_level}#{api_version}/#{path}?api_key=#{api_key}"
        end
      end
    end

    def request
      Net::HTTP::Get.new(url, headers)
    end

    def access_level
      Sportradar.configuration.
        access_levels[league].
        freeze
    end

    def api_key
      Sportradar.configuration.
        api_keys[league].
        freeze
    end

    def api_version
      case league
      when 'mlb'
        '5'
      when 'nfl'
        '1'
      else
        '5'
      end
    end

    private

    attr_reader :base_uri, :path, :query, :league, :sport, :endpoint

    def sport
      case league
      when 'mlb'
        'baseball'
      when 'nfl'
        'football'
      else
        'baseball'
      end
    end
  end
end
