require 'vcr_helper'

RSpec.describe Openaq::Client do
  let(:client) { described_class.new }

  describe '#cities' do
    it 'provides a simple listing of cities within the platform' do
      VCR.use_cassette('cities') do
        client.cities
        assert_requested(:get, 'https://api.openaq.org/v1/cities')
      end
    end

    it 'returns two cities from Germany' do
      VCR.use_cassette('german_cities') do
        german_cities = client.cities(page: 1, limit: 2, country: 'DE')
        assert_requested(:get, 'https://api.openaq.org/v1/cities?limit=2&country=DE&page=1')
        expect(german_cities.count).to eql(2)
        expect(german_cities.first['country']).to eql('DE')
        expect(german_cities[1]['country']).to eql('DE')
      end
    end

    context 'when a bad request is happening' do
      it 'is raising an Openag::Error' do
        stub_request(:get, 'https://api.openaq.org/v1/cities')
          .with(query: {'page': 'foo'})
          .to_raise(Openaq::Error.new('Bad Request'))

        expect {
          client.cities page: 'foo'
        }.to raise_error(Openaq::Error)
      end
    end
  end

  describe '#countries' do
    it 'provides a simple listing of countries within the platform' do
      VCR.use_cassette('countries') do
        client.countries
        assert_requested(:get, 'https://api.openaq.org/v1/countries')
      end

    end

    it 'returns only 5 countries' do
      VCR.use_cassette('get_5_countries') do
        countries = client.countries(limit: 5)
        assert_requested(:get, 'https://api.openaq.org/v1/countries?limit=5')
        expect(countries.count).to eql(5)
      end
    end
  end

  describe '#fetches' do
    it 'provides data about individual fetch operations that are used to populate data in the platform' do
      VCR.use_cassette('fetches') do
        client.fetches
        assert_requested(:get, 'https://api.openaq.org/v1/fetches')
      end
    end

    it 'returns only two results' do
      VCR.use_cassette('2_fetches') do
        fetches = client.fetches(limit: 2)
        assert_requested(:get, 'https://api.openaq.org/v1/fetches?limit=2')
        expect(fetches.count).to eql(2)
      end
    end
  end

  describe '#latest' do
    it 'provides the latest value of each available parameter for every location in the system' do
      VCR.use_cassette('latest') do
        client.latest
        assert_requested(:get, 'https://api.openaq.org/v1/latest')
      end
    end

    it 'returns 2 results from Berlin/Germany' do
      VCR.use_cassette('2_latest_from_berlin_germany') do
        latest = client.latest(limit: 2, country:'DE', city: 'Berlin')
        assert_requested(:get, 'https://api.openaq.org/v1/latest?limit=2&country=DE&city=Berlin')
        expect(latest.count).to eql(2)
        expect(latest[0]['country']).to eql('DE')
        expect(latest[0]['city']).to eql('Berlin')
        expect(latest[1]['country']).to eql('DE')
        expect(latest[1]['city']).to eql('Berlin')
      end
    end
  end

  describe '#locations' do
    it 'provides a list of measurement locations and their meta data' do
      VCR.use_cassette('locations') do
        client.locations
        assert_requested(:get, 'https://api.openaq.org/v1/locations')
      end
    end

    it 'returns 2 results from Berlin/Germany' do
      VCR.use_cassette('2_locations_from_berlin_germany') do
        locations = client.locations(limit: 2, country: 'DE', city: 'Berlin')
        assert_requested(:get, 'https://api.openaq.org/v1/locations?limit=2&country=DE&city=Berlin')
        expect(locations.count).to eql(2)
        expect(locations[0]['country']).to eql('DE')
        expect(locations[0]['city']).to eql('Berlin')
        expect(locations[1]['country']).to eql('DE')
        expect(locations[1]['city']).to eql('Berlin')
      end
    end
  end

  describe '#measurements' do
    it 'provides data about individual measurements' do
      VCR.use_cassette('measurements') do
        client.measurements
        assert_requested(:get, 'https://api.openaq.org/v1/measurements')
      end
    end

    it 'returns 2 results from Berlin/Germany' do
      VCR.use_cassette('2_measurements_from_berlin_germany') do
        measurements = client.measurements(limit: 2, country: 'DE', city: 'Berlin')
        assert_requested(:get, 'https://api.openaq.org/v1/measurements?limit=2&country=DE&city=Berlin')
        expect(measurements.count).to eql(2)
        expect(measurements[0]['country']).to eql('DE')
        expect(measurements[0]['city']).to eql('Berlin')
        expect(measurements[1]['country']).to eql('DE')
        expect(measurements[1]['city']).to eql('Berlin')
      end
    end
  end

  describe '#parameters' do
    it 'provides a simple listing of parameters within the platform' do
      VCR.use_cassette('parameters') do
        client.parameters
        assert_requested(:get, 'https://api.openaq.org/v1/parameters')
      end
    end
  end

  describe '#sources' do
    it 'provides a list of data sources' do
      VCR.use_cassette('sources') do
        client.sources
        assert_requested(:get, 'https://api.openaq.org/v1/sources')
      end
    end

    it 'returns only 2 results' do
      VCR.use_cassette('2_sources') do
        sources = client.sources(limit: 2)
        assert_requested(:get, 'https://api.openaq.org/v1/sources?limit=2')
        expect(sources.count).to eql(2)
      end
    end
  end
end
