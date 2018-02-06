RSpec.describe Openaq::Networking do
  before do
    @client = Openaq.client
  end

  describe "#get" do
    it "should do a get request and return a response" do
      VCR.use_cassette("get_request") do
        @client.cities
        assert_requested(:get, "https://api.openaq.org/v1/cities")
      end
    end
  end
end
