require "openaq/networking"

module Openaq
  class Client
    include Networking

    [
      :cities,
      :countries,
      :fetches,
      :latest,
      :locations,
      :measurements,
      :parameters,
      :sources,
    ].each do |name|
      define_method(name) do |params={}|
        get("/#{name}", params)
      end

      define_method(:"all_#{name}") do |params={}|
        paginated_get("/#{name}", params)
      end
    end

  end
end
