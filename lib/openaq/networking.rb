require 'net/http'

module Openaq
  module Networking

    API_ENDPOINT = "https://api.openaq.org/v1".freeze

    def get(path)
      uri = URI(API_ENDPOINT + path)
      Net::HTTP.get_response(uri)
    end

  end
end
