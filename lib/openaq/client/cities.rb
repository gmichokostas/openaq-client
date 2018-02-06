module Openaq
  class Client
    module Cities

      def cities
        get("/cities")
      end

    end
  end
end
