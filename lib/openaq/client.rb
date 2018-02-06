require "openaq/client/version"
require "openaq/client/cities"

module Openaq
  class Client
    include Openaq::Client::Cities
  end
end
