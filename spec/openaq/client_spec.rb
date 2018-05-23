RSpec.describe Openaq::Client do
  let(:client) { Openaq.client }

  describe '#cities' do
    it 'provides a simple listing of cities within the platform' do
      VCR.use_cassette('cities') do
        client.cities
        assert_requested(:get, 'https://api.openaq.org/v1/cities')
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
  end

  describe '#fetches' do
    it 'provides data about individual fetch operations that are used to populate data in the platform' do
      VCR.use_cassette('fetches') do
        client.fetches
        assert_requested(:get, 'https://api.openaq.org/v1/fetches')
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
  end

  describe '#locations' do
    it 'provides a list of measurement locations and their meta data' do
      VCR.use_cassette('locations') do
        client.locations
        assert_requested(:get, 'https://api.openaq.org/v1/locations')
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
    end

end
