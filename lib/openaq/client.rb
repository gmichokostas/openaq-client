require "openaq/networking"

module Openaq
  class Client
    include Networking

    ENDPOINTS = [
      :cities,
      :countries,
      :fetches,
      :latest,
      :locations,
      :measurements,
      :parameters,
      :sources,
    ].freeze

    private_constant :ENDPOINTS

    class << self

      # @!method all_cities(params = {})
      # Returns an Enumerator of {.cities}
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Enumerator]

      # @!method all_countries(params = {})
      # Returns an Enumerator of {.countries}
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Enumerator]

      # @!method all_fetches(params = {})
      # Returns an Enumerator of {.fetches}
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Enumerator]

      # @!method all_latest(params = {})
      # Returns an Enumerator of {.latest}
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Enumerator]

      # @!method all_locations(params = {})
      # Returns an Enumerator of {.locations}
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Enumerator]

      # @!method all_measurements(params = {})
      # Returns an Enumerator of {.measurements}
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Enumerator]

      # @!method all_parameters(params = {})
      # Returns an Enumerator of {.parameters}
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Enumerator]

      # @!method all_sources(params = {})
      # Returns an Enumerator of {.sources}
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Enumerator]

      # @!method cities(params = {})
      # Provides a simple listing of cities within the platform.
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Array<Hash>]

      # @!method countries(params = {})
      # Provides a simple listing of countries within the platform.
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Array<Hash>]

      # @!method fetches(params = {})
      # Providing data about individual fetch operations that are used to populate data in the platform.
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Array<Hash>]

      # @!method latest(params = {})
      # Provides the latest value of each available parameter for every location in the system.
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Array<Hash>]

      # @!method locations(params = {})
      # Provides a list of measurement locations and their meta data.
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Array<Hash>]

      # @!method measurements(params = {})
      # Provides data about individual measurements
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Array<Hash>]

      # @!method parameters(params = {})
      # Provides a simple listing of parameters within the platform.
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Array<Hash>]

      # @!method sources(params = {})
      # Provides a list of data sources.
      #
      # @param params please read the {https://docs.openaq.org Api Documentation}
      # @return [Array<Hash>]
    end

    ENDPOINTS.each do |name|
      define_method(name) do |**params|
        get("/#{name}", params)
      end

      define_method(:"all_#{name}") do |**params|
        paginated_get("/#{name}", params)
      end
    end

  end
end
