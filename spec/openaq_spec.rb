RSpec.describe Openaq do
  it "has a version number" do
    expect(Openaq::VERSION).not_to be nil
    expect(Openaq::VERSION).to eql "0.2.0"
  end

  describe ".client" do
    it "should create and return a new client" do
      expect(Openaq.client).to be_a(Openaq::Client)
    end
  end
end
