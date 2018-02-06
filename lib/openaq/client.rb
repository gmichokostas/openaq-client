require "openaq/networking"
require "openaq/client/version"
require "openaq/client/cities"

module Openaq
  class Client
    include Networking
    include Openaq::Client::Cities
  end
end
