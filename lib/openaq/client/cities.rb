module Openaq
  class Client
    module Cities

      def cities()
        uri = URI("https://api.openaq.org/v1/cities")
        Net::HTTP.get_response(uri)
      end

    end
  end
end
