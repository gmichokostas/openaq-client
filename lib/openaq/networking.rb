require 'json'
require 'net/http'

module Openaq
  module Networking
    DEFAULT_ENDPOINT = "https://api.openaq.org/v1".freeze

    def get(path, params={})
      uri = URI(DEFAULT_ENDPOINT + path)
      uri.query = URI.encode_www_form(params)
      Net::HTTP.get_response(uri)
    end

    def paginated_get(path, params={})
      Enumerator.new do |yielder|
        page = 1
        params = { page: page }.merge(params)

        loop do
          response = get(path, params)
          json_response = JSON.parse(response.body)
          if response.code == "200" && !json_response["results"].empty?
            json_response["results"].map { |item| yielder << item }
            params[:page] += 1
          else
            raise StopIteration
          end
        end
      end.lazy
    end

  end
end
