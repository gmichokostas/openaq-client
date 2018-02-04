RSpec.describe Openaq::Client::Cities do
  before do
    @client = Openaq::Client.new
  end

  describe ".cities" do
    it "returns all the cities" do
      VCR.use_cassette("cities") do
        cities_response = @client.cities

        assert_requested(:get, "https://api.openaq.org/v1/cities")
      end
    end
  end

end
