# frozen_string_literal: true

require 'json'
require 'net/http'

module Openaq
  module Networking
    PARAMS = {}.freeze

    # @raise [Openaq::Error] if the request is not successful
    def get(path, params = PARAMS)
      uri             = build_uri(path, params)
      response        = Net::HTTP.get_response(uri)
      parsed_response = JSON.parse(response.body)

      if not response.is_a?(Net::HTTPSuccess)
        err_msg = "#{parsed_response['error']}, #{parsed_response['message']}"
        raise Openaq::Error, err_msg
      end

      parsed_response['results']
    end

    # @raise [StopIteration] when there are no more results
    # @raise [Openaq::Error] if the request is not successful
    def paginated_get(path, params = PARAMS)
      Enumerator.new do |yielder|
        page = 1
        params = { page: page }.merge(params)

        loop do
          response = get(path, params)
          if !response.empty?
            response.map { |item| yielder << item }
            params[:page] += 1
          else
            raise StopIteration
          end
        end
      end.lazy
    end

    private

    def build_uri(path, params)
      uri = URI(Openaq.url + path)
      uri.query = URI.encode_www_form(params)
      uri
    end
  end
end
