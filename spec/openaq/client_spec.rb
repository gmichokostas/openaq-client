RSpec.describe Openaq::Client do
  it "has a version number" do
    expect(Openaq::VERSION).not_to be nil
    expect(Openaq::VERSION).to eql "0.1.0"
  end
end
