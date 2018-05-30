module Openaq
  module Networking

    # @raise [Openaq::Error] if the request is not successful

    def get(path, params={})
      uri = URI(Openaq.url + path)
      uri.query = URI.encode_www_form(params)

      begin
        response = Net::HTTP.get_response(uri)
      rescue Timeout::Error, Errno::ECONNREFUSED => e
        raise Openaq::Error, e.message
      end

      parsed_response = JSON.parse(response.body) rescue { "results" => [] }
      if !response.is_a?(Net::HTTPSuccess)
        raise Openaq::Error, parsed_response["error"] || "Openaq responded with #{response.code}."
      end

      parsed_response["results"]
    end

    # @raise [StopIteration] when there are no more results

    def paginated_get(path, params={})
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

  end
end
